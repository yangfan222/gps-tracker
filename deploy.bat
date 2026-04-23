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
git pull origin master
if errorlevel 1 (
    echo [ERROR] Git pull failed!
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

:: Try pm2 first
where pm2 >nul 2>&1
if !errorlevel! equ 0 (
    echo Using pm2 to restart...
    call pm2 restart gps-tracker 2>nul
    if !errorlevel! neq 0 (
        echo pm2 process not found, starting new...
        cd /d "%PROJECT_DIR%\backend"
        call pm2 start dist/main.js --name gps-tracker
    )
    call pm2 status
    echo [OK] Service restarted via pm2.
) else (
    echo pm2 not found, using direct node...
    :: Kill existing node processes running main.js
    for /f "tokens=2" %%i in ('tasklist /fi "imagename eq node.exe" /fo csv /nh 2^>nul') do (
        set "pid=%%~i"
    )
    taskkill /f /im node.exe >nul 2>&1
    echo Old processes killed.
    
    :: Start backend in background
    cd /d "%PROJECT_DIR%\backend"
    start "GPS-Tracker-Backend" /min cmd /c "node dist/main.js"
    
    :: Wait and verify
    timeout /t 3 /nobreak >nul
    netstat -an | findstr ":3000" >nul
    if !errorlevel! equ 0 (
        echo [OK] Backend running on port 3000.
    ) else (
        echo [WARN] Port 3000 not detected yet, service may still be starting...
    )
)

echo.
echo ============================================
echo   Deploy Complete!
echo   Backend: http://1.94.48.15:3000
echo ============================================
echo.
pause
