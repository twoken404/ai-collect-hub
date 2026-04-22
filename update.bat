@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 默认提交信息
set "commit_msg=更新 AI 工具"

:: 如果用户提供了参数（例如：update.bat "添加了ChatGPT"），则使用参数作为提交信息
if not "%1"=="" set "commit_msg=%*"

echo.
echo ========================================
echo 正在重新生成 tools.json ...
echo ========================================
call npm run prebuild
if errorlevel 1 (
    echo [错误] 生成失败，请检查 Markdown 文件格式。
    pause
    exit /b 1
)

echo.
echo ========================================
echo 正在添加所有更改到 Git ...
echo ========================================
git add .
if errorlevel 1 (
    echo [错误] Git add 失败，请确保当前目录是 Git 仓库。
    pause
    exit /b 1
)

echo.
echo ========================================
echo 提交更改: %commit_msg%
echo ========================================
git commit -m "%commit_msg%"
if errorlevel 1 (
    echo [警告] 没有需要提交的更改，或提交失败。
)

echo.
echo ========================================
echo 推送到远程仓库 main 分支 ...
echo ========================================
git push origin main
if errorlevel 1 (
    echo [错误] 推送失败，请检查网络或权限。
    pause
    exit /b 1
)

echo.
echo ========================================
echo ✅ 完成！GitHub Actions 将自动部署。
echo ========================================
pause