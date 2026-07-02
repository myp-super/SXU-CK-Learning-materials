@echo off
chcp 65001 >nul
title Software PLL Data Viewer
cd /d "%~dp0"

echo ============================================
echo   Software PLL - Python Data Viewer
echo ============================================
echo.
echo [1/3] Checking and installing dependencies...
python --version >nul 2>&1
if errorlevel 1 ( echo [ERROR] Python not found! & pause & exit /b 1 )
pip install -r requirements.txt -q 2>nul

echo [2/3] Collecting 5 seconds of data from STM32...
python collect.py
if errorlevel 1 (
    echo [ERROR] Collection failed! Check:
    echo   1. USB-TTL is connected
    echo   2. No other program is using the COM port
    echo   3. STM32 is running (LED is on)
    pause & exit /b 1
)

echo [3/3] Plotting...
python plot_data.py

echo.
echo ============================================
echo   Done! Data: collected_data.csv
echo         Plot: collected_data.png
echo ============================================
pause
