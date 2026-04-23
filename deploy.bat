@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ============================================
echo   GPS Tracker - Server Deploy Script
echo ============================================
echo.

:: Set project root
set "PROJECT_DIR=C:\gps-tracker"
cd /d "%PROJECT_DIR%" || (
    echo [ERROR] Project directory not found: %PROJECT_DIR%
    pause
    exit /b 1
)

echo [1/6] Pulling latest code from GitHub...
echo --------------------------------------------
git config http.postBuffer 524288000
git fetch --depth=1 origin master
if errorlevel 1 (
    echo [ERROR] Git fetch failed!
    pause
    exit /b 1
)
git reset --hard origin/master
if errorlevel 1 (
    echo [ERROR] Git reset failed!
    pause
    exit /b 1
)
echo [OK] Code updated.
echo.

echo [2/6] Installing frontend dependencies...
echo --------------------------------------------
cd /d "%PROJECT_DIR%\frontend"
call npm install --legacy-peer-deps --silent
if errorlevel 1 (
    echo [WARN] npm install had warnings, continuing...
)
echo [OK] Frontend dependencies ready.
echo.

echo [3/6] Building frontend H5...
echo --------------------------------------------
call npm run build:h5
if errorlevel 1 (
    echo [ERROR] Frontend build failed!
    pause
    exit /b 1
)
echo [OK] Frontend built successfully.
echo.

echo [4/6] Installing backend dependencies...
echo --------------------------------------------
cd /d "%PROJECT_DIR%\backend"
call npm install --silent
if errorlevel 1 (
    echo [WARN] npm install had warnings, continuing...
)
echo [OK] Backend dependencies ready.
echo.

echo [5/6] Building backend...
echo --------------------------------------------
call npm run build
if errorlevel 1 (
    echo [ERROR] Backend build failed!
    pause
    exit /b 1
)
echo [OK] Backend built successfully.
echo.

echo [6/6] Restarting backend service...
echo --------------------------------------------

:: Kill ALL existing node processes
echo Stopping old services...
taskkill /f /im node.exe >nul 2>&1
timeout /t 2 /nobreak >nul

:: Start backend in a new visible window that stays open
cd /d "%PROJECT_DIR%\backend"
echo Starting backend service...
start "GPS-Tracker-Backend [port 3000]" cmd /k "cd /d %PROJECT_DIR%\backend && node dist/main.js"

:: Wait for startup
echo Waiting for service to start...
timeout /t 5 /nobreak >nul

:: Verify
netstat -an | findstr "LISTENING" | findstr ":3000" >nul
if !errorlevel! equ 0 (
    echo [OK] Backend is running on port 3000!
) else (
    echo [INFO] Service is starting in the new window, please check it.
)

echo.
echo ============================================
echo   Deploy Complete!
echo   Backend: http://1.94.48.15:3000
echo   
echo   Backend is running in the other window.
echo   DO NOT close that window!
echo ============================================
echo.
pause
