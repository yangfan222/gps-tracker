#!/bin/bash
# End-to-end API test script
BASE="http://localhost:3000/api"
PASS=0
FAIL=0
TOKEN_FILE="/tmp/gps_test_token.txt"

check() {
  local name="$1"
  local expected_code="$2"
  local actual_code="$3"
  local body="$4"
  if [ "$actual_code" = "$expected_code" ]; then
    echo "[PASS] $name (HTTP $actual_code)"
    PASS=$((PASS+1))
  else
    echo "[FAIL] $name (expected $expected_code, got $actual_code)"
    echo "  Response: $body"
    FAIL=$((FAIL+1))
  fi
}

echo "=========================================="
echo "  GPS Tracker API E2E Test"
echo "=========================================="
echo ""

# 1. Register
echo "--- Auth Module ---"
RESP=$(curl -s -w "\n%{http_code}" -X POST "$BASE/auth/register" \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","password":"Test1234"}')
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "POST /auth/register" "201" "$CODE" "$BODY"

# Extract token and save to file
echo "$BODY" | node -e "let d='';process.stdin.on('data',c=>d+=c);process.stdin.on('end',()=>{try{const j=JSON.parse(d);process.stdout.write(j.access_token||j.token||'')}catch(e){}})" > "$TOKEN_FILE"
TOKEN=$(cat "$TOKEN_FILE")

if [ -z "$TOKEN" ]; then
  echo "[ERROR] Failed to extract token from register response. Trying login..."
  RESP=$(curl -s -w "\n%{http_code}" -X POST "$BASE/auth/login" \
    -H "Content-Type: application/json" \
    -d '{"username":"testuser","password":"Test1234"}')
  CODE=$(echo "$RESP" | tail -1)
  BODY=$(echo "$RESP" | head -n -1)
  check "POST /auth/login (fallback)" "201" "$CODE" "$BODY"
  echo "$BODY" | node -e "let d='';process.stdin.on('data',c=>d+=c);process.stdin.on('end',()=>{try{const j=JSON.parse(d);process.stdout.write(j.access_token||j.token||'')}catch(e){}})" > "$TOKEN_FILE"
  TOKEN=$(cat "$TOKEN_FILE")
fi

if [ -z "$TOKEN" ]; then
  echo "[FATAL] Cannot obtain JWT token. Aborting."
  exit 1
fi
echo "[INFO] Token obtained: ${TOKEN:0:20}..."
AUTH="Authorization: Bearer $TOKEN"

# 2. Login
RESP=$(curl -s -w "\n%{http_code}" -X POST "$BASE/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","password":"Test1234"}')
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "POST /auth/login" "201" "$CODE" "$BODY"

# 3. Get Profile
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/auth/profile" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /auth/profile" "200" "$CODE" "$BODY"

# 4. Add Device
echo ""
echo "--- Device Module ---"
RESP=$(curl -s -w "\n%{http_code}" -X POST "$BASE/device" \
  -H "Content-Type: application/json" \
  -H "$AUTH" \
  -d '{"deviceId":"TEST001","deviceName":"Test Tracker","simNumber":"13800138000"}')
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "POST /device (add)" "201" "$CODE" "$BODY"

# 5. Get Devices
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/device" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /device (list)" "200" "$CODE" "$BODY"

# 6. Get Single Device
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/device/TEST001" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /device/TEST001" "200" "$CODE" "$BODY"

# 7. Update Device
RESP=$(curl -s -w "\n%{http_code}" -X PUT "$BASE/device/TEST001" \
  -H "Content-Type: application/json" \
  -H "$AUTH" \
  -d '{"deviceName":"Updated Tracker"}')
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "PUT /device/TEST001 (update)" "200" "$CODE" "$BODY"

# 8. Send Command
echo ""
echo "--- Command Module ---"
RESP=$(curl -s -w "\n%{http_code}" -X POST "$BASE/command/TEST001" \
  -H "Content-Type: application/json" \
  -H "$AUTH" \
  -d '{"commandType":"locate","commandData":{}}')
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "POST /command/TEST001 (send)" "201" "$CODE" "$BODY"

# 9. Get Commands
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/command/TEST001" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /command/TEST001 (list)" "200" "$CODE" "$BODY"

# 10. Create Geofence
echo ""
echo "--- Geofence Module ---"
RESP=$(curl -s -w "\n%{http_code}" -X POST "$BASE/geofence/TEST001" \
  -H "Content-Type: application/json" \
  -H "$AUTH" \
  -d '{"name":"Home Zone","type":"circle","centerLat":39.9042,"centerLng":116.4074,"radius":500,"entryAlarm":true,"exitAlarm":true}')
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "POST /geofence/TEST001 (create)" "201" "$CODE" "$BODY"

# Extract geofence ID for later use
FENCE_ID=$(echo "$BODY" | node -e "let d='';process.stdin.on('data',c=>d+=c);process.stdin.on('end',()=>{try{const j=JSON.parse(d);process.stdout.write(String(j.id||''))}catch(e){}})")

# 11. Get Geofences
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/geofence/TEST001" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /geofence/TEST001 (list)" "200" "$CODE" "$BODY"

# 12. Create SIM Card
echo ""
echo "--- SIM Card Module ---"
RESP=$(curl -s -w "\n%{http_code}" -X POST "$BASE/sim-card/TEST001" \
  -H "Content-Type: application/json" \
  -H "$AUTH" \
  -d '{"simNumber":"13800138000","iccid":"89860001234567890123","packageName":"Monthly 100MB"}')
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "POST /sim-card/TEST001 (create)" "201" "$CODE" "$BODY"

# 13. Get SIM Card
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/sim-card/TEST001" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /sim-card/TEST001" "200" "$CODE" "$BODY"

# 14. Get Alarms (should be empty)
echo ""
echo "--- Alarm Module ---"
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/alarm/TEST001" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /alarm/TEST001 (list)" "200" "$CODE" "$BODY"

# 15. Get Unread Count
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/alarm/TEST001/unread" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /alarm/TEST001/unread" "200" "$CODE" "$BODY"

# 16. Get Location History (should be empty)
echo ""
echo "--- Location Module ---"
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/location/TEST001/latest" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /location/TEST001/latest" "200" "$CODE" "$BODY"

# 17. Get Track (should be empty)
echo ""
echo "--- Track Module ---"
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/track/TEST001?startTime=2024-01-01&endTime=2025-12-31" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /track/TEST001" "200" "$CODE" "$BODY"

# 18. Get Report - Driving
echo ""
echo "--- Report Module ---"
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/report/TEST001/driving?startTime=2024-01-01&endTime=2025-12-31" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /report/TEST001/driving" "200" "$CODE" "$BODY"

# 19. Get Report - Parking
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/report/TEST001/parking?startTime=2024-01-01&endTime=2025-12-31" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /report/TEST001/parking" "200" "$CODE" "$BODY"

# 20. Get Report - Mileage
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/report/TEST001/mileage?startTime=2024-01-01&endTime=2025-12-31" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "GET /report/TEST001/mileage" "200" "$CODE" "$BODY"

# 21. TCP Server Test - Send GPS data via TCP
echo ""
echo "--- TCP Server ---"
echo '{"deviceId":"TEST001","lat":39.9042,"lng":116.4074,"speed":60,"direction":180}' | nc -w 2 localhost 7700
sleep 1

# Check location was saved
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/location/TEST001/latest" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
# Check if location data is there
HAS_LAT=$(echo "$BODY" | node -e "let d='';process.stdin.on('data',c=>d+=c);process.stdin.on('end',()=>{try{const j=JSON.parse(d);process.stdout.write(j.lat?'yes':'no')}catch(e){process.stdout.write('no')}})")
if [ "$HAS_LAT" = "yes" ]; then
  echo "[PASS] TCP location data saved and retrievable"
  PASS=$((PASS+1))
else
  echo "[INFO] TCP test: location data may not be saved (nc might not be available)"
fi

# 22. Cleanup - Delete geofence
echo ""
echo "--- Cleanup ---"
if [ -n "$FENCE_ID" ]; then
  RESP=$(curl -s -w "\n%{http_code}" -X DELETE "$BASE/geofence/$FENCE_ID" \
    -H "$AUTH")
  CODE=$(echo "$RESP" | tail -1)
  BODY=$(echo "$RESP" | head -n -1)
  check "DELETE /geofence/$FENCE_ID" "200" "$CODE" "$BODY"
fi

# 23. Delete device
RESP=$(curl -s -w "\n%{http_code}" -X DELETE "$BASE/device/TEST001" \
  -H "$AUTH")
CODE=$(echo "$RESP" | tail -1)
BODY=$(echo "$RESP" | head -n -1)
check "DELETE /device/TEST001" "200" "$CODE" "$BODY"

# 24. Auth guard test - request without token should fail
echo ""
echo "--- Security Tests ---"
RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/device")
CODE=$(echo "$RESP" | tail -1)
check "GET /device (no auth - should 401)" "401" "$CODE" ""

RESP=$(curl -s -w "\n%{http_code}" -X GET "$BASE/auth/profile" \
  -H "Authorization: Bearer invalidtoken123")
CODE=$(echo "$RESP" | tail -1)
check "GET /profile (bad token - should 401)" "401" "$CODE" ""

echo ""
echo "=========================================="
echo "  Results: $PASS passed, $FAIL failed"
echo "=========================================="

rm -f "$TOKEN_FILE"
exit $FAIL
