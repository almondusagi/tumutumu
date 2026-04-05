@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ================================
echo Starting server with ngrok
echo ================================

IF NOT EXIST "ngrok.exe" (
    echo Downloading ngrok...
    powershell -Command "Invoke-WebRequest -Uri 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip' -OutFile 'ngrok.zip'"
    powershell -Command "Expand-Archive -Path 'ngrok.zip' -DestinationPath '.' -Force"
    del ngrok.zip
    echo Done.
)

echo Starting local server...
start python -m http.server 8000

echo.
echo Launching ngrok...
echo Copy the https URL shown below.

ngrok.exe http 8000

pause