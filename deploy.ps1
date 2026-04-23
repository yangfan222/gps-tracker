# GPS Tracker 一键部署脚本 (Windows Server)
# 在服务器的 PowerShell 中运行此脚本

$ErrorActionPreference = "Continue"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  GPS Tracker 一键部署脚本" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Step 1: 检查/安装 Node.js
Write-Host "`n[1/5] 检查 Node.js..." -ForegroundColor Yellow
$nodeVersion = $null
try { $nodeVersion = node --version 2>$null } catch {}

if (-not $nodeVersion) {
    Write-Host "Node.js 未安装，正在下载安装..." -ForegroundColor Yellow
    $nodeUrl = "https://npmmirror.com/mirrors/node/v20.18.0/node-v20.18.0-x64.msi"
    $nodeInstaller = "$env:TEMP\node-installer.msi"
    
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $nodeUrl -OutFile $nodeInstaller -UseBasicParsing
    
    Write-Host "正在安装 Node.js..." -ForegroundColor Yellow
    Start-Process msiexec.exe -ArgumentList "/i `"$nodeInstaller`" /qn /norestart" -Wait -NoNewWindow
    
    # 刷新环境变量
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    $nodeVersion = node --version 2>$null
    if ($nodeVersion) {
        Write-Host "Node.js $nodeVersion 安装成功!" -ForegroundColor Green
    } else {
        Write-Host "Node.js 安装可能需要重启 PowerShell，请关闭后重新打开 PowerShell 再运行此脚本" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Node.js $nodeVersion 已安装" -ForegroundColor Green
}

# Step 2: 检查/安装 Git
Write-Host "`n[2/5] 检查 Git..." -ForegroundColor Yellow
$gitVersion = $null
try { $gitVersion = git --version 2>$null } catch {}

if (-not $gitVersion) {
    Write-Host "Git 未安装，正在下载安装..." -ForegroundColor Yellow
    $gitUrl = "https://npmmirror.com/mirrors/git-for-windows/v2.47.0.windows.2/Git-2.47.0.2-64-bit.exe"
    $gitInstaller = "$env:TEMP\git-installer.exe"
    
    Invoke-WebRequest -Uri $gitUrl -OutFile $gitInstaller -UseBasicParsing
    
    Write-Host "正在安装 Git（静默模式）..." -ForegroundColor Yellow
    Start-Process $gitInstaller -ArgumentList "/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS" -Wait -NoNewWindow
    
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    $gitVersion = git --version 2>$null
    if ($gitVersion) {
        Write-Host "Git 安装成功!" -ForegroundColor Green
    } else {
        Write-Host "Git 安装可能需要重启 PowerShell" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Git $gitVersion 已安装" -ForegroundColor Green
}

# Step 3: 克隆项目
Write-Host "`n[3/5] 克隆项目代码..." -ForegroundColor Yellow
$projectDir = "C:\gps-tracker"

if (Test-Path $projectDir) {
    Write-Host "项目目录已存在，拉取最新代码..." -ForegroundColor Yellow
    Set-Location $projectDir
    git pull origin master 2>&1
} else {
    git clone https://github.com/yangfan222/gps-tracker.git $projectDir 2>&1
    Set-Location $projectDir
}
Write-Host "代码准备完成!" -ForegroundColor Green

# Step 4: 安装依赖并构建
Write-Host "`n[4/5] 安装依赖并构建项目..." -ForegroundColor Yellow

# 设置 npm 镜像加速
npm config set registry https://registry.npmmirror.com

Write-Host "安装前端依赖..." -ForegroundColor Yellow
Set-Location "$projectDir\frontend"
npm install 2>&1

Write-Host "构建前端..." -ForegroundColor Yellow
npm run build:h5 2>&1

Write-Host "安装后端依赖..." -ForegroundColor Yellow
Set-Location "$projectDir\backend"
npm install 2>&1

Write-Host "构建后端..." -ForegroundColor Yellow
npm run build 2>&1

Write-Host "构建完成!" -ForegroundColor Green

# Step 5: 启动服务
Write-Host "`n[5/5] 启动 GPS Tracker 服务..." -ForegroundColor Yellow
Set-Location "$projectDir\backend"

# 先停止已有的进程
Get-Process -Name "node" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

# 设置环境变量
$env:PORT = "3000"
$env:NODE_ENV = "production"

# 启动服务
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  正在启动服务..." -ForegroundColor Cyan
Write-Host "  公网访问地址: http://1.94.48.15:3000" -ForegroundColor Green
Write-Host "  用户名: 123 / admin" -ForegroundColor Green
Write-Host "  密码: 123456 / admin123" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan

node dist/main
