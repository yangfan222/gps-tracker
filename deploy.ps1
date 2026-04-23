# GPS Tracker 一键部署脚本 (Windows Server)
# 用法: powershell -ExecutionPolicy Bypass -File C:\deploy.ps1

$ErrorActionPreference = "Continue"
$SERVER_IP = "1.94.48.15"
$PROJECT_DIR = "C:\gps-tracker"
$REPO_URL = "https://github.com/yangfan222/gps-tracker.git"

function Refresh-Path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  GPS Tracker 一键部署脚本" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# ========== 1. 安装 Node.js ==========
Write-Host "`n[1/6] 检查 Node.js..." -ForegroundColor Yellow
$hasNode = $false
try { $null = node --version 2>$null; $hasNode = $true } catch {}
if (-not $hasNode) {
    Write-Host "  下载 Node.js..." -ForegroundColor Gray
    Invoke-WebRequest -Uri "https://npmmirror.com/mirrors/node/v20.18.0/node-v20.18.0-x64.msi" -OutFile "C:\node.msi" -UseBasicParsing
    Write-Host "  安装中..." -ForegroundColor Gray
    Start-Process msiexec.exe -ArgumentList "/i C:\node.msi /qn /norestart" -Wait -NoNewWindow
    Refresh-Path
    Write-Host "  Node.js 安装完成!" -ForegroundColor Green
} else {
    Write-Host "  已安装: $(node --version)" -ForegroundColor Green
}

# ========== 2. 安装 Git ==========
Write-Host "`n[2/6] 检查 Git..." -ForegroundColor Yellow
$hasGit = $false
try { $null = git --version 2>$null; $hasGit = $true } catch {}
if (-not $hasGit) {
    Write-Host "  下载 Git..." -ForegroundColor Gray
    Invoke-WebRequest -Uri "https://npmmirror.com/mirrors/git-for-windows/v2.47.0.windows.2/Git-2.47.0.2-64-bit.exe" -OutFile "C:\git.exe" -UseBasicParsing
    Write-Host "  安装中..." -ForegroundColor Gray
    Start-Process "C:\git.exe" -ArgumentList "/VERYSILENT /NORESTART /NOCANCEL /SP-" -Wait -NoNewWindow
    Refresh-Path
    Write-Host "  Git 安装完成!" -ForegroundColor Green
} else {
    Write-Host "  已安装: $(git --version)" -ForegroundColor Green
}

# ========== 3. 安装 Python (sqlite3 编译需要) ==========
Write-Host "`n[3/6] 检查 Python..." -ForegroundColor Yellow
$hasPython = $false
try { $null = python --version 2>$null; $hasPython = $true } catch {}
if (-not $hasPython) {
    Write-Host "  下载 Python..." -ForegroundColor Gray
    Invoke-WebRequest -Uri "https://mirrors.huaweicloud.com/python/3.12.0/python-3.12.0-amd64.exe" -OutFile "C:\python.exe" -UseBasicParsing
    Write-Host "  安装中..." -ForegroundColor Gray
    Start-Process "C:\python.exe" -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait -NoNewWindow
    Refresh-Path
    Write-Host "  Python 安装完成!" -ForegroundColor Green
} else {
    Write-Host "  已安装: $(python --version 2>&1)" -ForegroundColor Green
}

# 最终刷新 PATH
Refresh-Path

# ========== 4. 克隆/更新项目 ==========
Write-Host "`n[4/6] 准备项目代码..." -ForegroundColor Yellow
if (Test-Path "$PROJECT_DIR\.git") {
    Write-Host "  拉取最新代码..." -ForegroundColor Gray
    Set-Location $PROJECT_DIR
    git pull origin master 2>&1
} else {
    if (Test-Path $PROJECT_DIR) { Remove-Item $PROJECT_DIR -Recurse -Force }
    Write-Host "  克隆项目..." -ForegroundColor Gray
    git clone $REPO_URL $PROJECT_DIR 2>&1
    Set-Location $PROJECT_DIR
}
Write-Host "  代码准备完成!" -ForegroundColor Green

# ========== 5. 安装依赖 + 构建 ==========
Write-Host "`n[5/6] 安装依赖并构建..." -ForegroundColor Yellow
npm config set registry https://registry.npmmirror.com

Write-Host "  [前端] 安装依赖..." -ForegroundColor Gray
Set-Location "$PROJECT_DIR\frontend"
npm install --legacy-peer-deps 2>&1

Write-Host "  [前端] 构建..." -ForegroundColor Gray
npm run build:h5 2>&1

Write-Host "  [后端] 安装依赖..." -ForegroundColor Gray
Set-Location "$PROJECT_DIR\backend"
npm install --legacy-peer-deps 2>&1

Write-Host "  [后端] 构建..." -ForegroundColor Gray
npm run build 2>&1

Write-Host "  构建全部完成!" -ForegroundColor Green

# ========== 6. 启动服务 ==========
Write-Host "`n[6/6] 启动服务..." -ForegroundColor Yellow

# 停止旧进程
Get-Process -Name "node" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

# 配置防火墙
netsh advfirewall firewall delete rule name="GPS Tracker" >$null 2>&1
netsh advfirewall firewall add rule name="GPS Tracker" dir=in action=allow protocol=tcp localport=3000 >$null 2>&1

# 启动
Set-Location "$PROJECT_DIR\backend"
$env:PORT = "3000"
$env:NODE_ENV = "production"

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  部署成功!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  公网地址: http://${SERVER_IP}:3000" -ForegroundColor Green
Write-Host "  用户名: admin    密码: admin123" -ForegroundColor Green
Write-Host "  用户名: 123      密码: 123456" -ForegroundColor Green
Write-Host "  按 Ctrl+C 停止服务" -ForegroundColor Gray
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

node dist/main
