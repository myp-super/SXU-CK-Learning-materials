@echo off
chcp 65001 >nul
title Software PLL - Course Design Project
cls
echo.
echo ╔══════════════════════════════════════════════════════╗
echo ║     Software PLL 实验平台                            ║
echo ║     电网PLL模拟测试 - 本科课程设计                    ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo ┌──────────────────────────────────────────────────────┐
echo │  [1] MATLAB 理论验证                                 │
echo │      运行全部4个Case，生成PNG/CSV/MAT数据             │
echo ├──────────────────────────────────────────────────────┤
echo │  [2] Python 软件示波器                               │
echo │      启动虚拟示波器GUI (需先连接STM32)               │
echo ├──────────────────────────────────────────────────────┤
echo │  [3] 全部运行                                        │
echo │      先MATLAB验证，再启动Python示波器                │
echo ├──────────────────────────────────────────────────────┤
echo │  [4] 查看MATLAB结果                                  │
echo │      打开figures文件夹                              │
echo ├──────────────────────────────────────────────────────┤
echo │  [5] 打开STM32工程                                   │
echo │      启动STM32CubeMX                                 │
echo ├──────────────────────────────────────────────────────┤
echo │  [0] 退出                                            │
echo └──────────────────────────────────────────────────────┘
echo.
choice /c 123450 /n /m "请选择 [1-5, 0=退出]: "

if errorlevel 6 goto exit
if errorlevel 5 goto stm32
if errorlevel 4 goto figures
if errorlevel 3 goto all
if errorlevel 2 goto python
if errorlevel 1 goto matlab

:matlab
echo.
echo ============================================
echo   启动 MATLAB 验证...
echo ============================================
cd /d "%~dp0MATLAB"
call Run_MATLAB.bat
cd /d "%~dp0"
goto menu

:python
echo.
echo ============================================
echo   启动 Python 软件示波器...
echo ============================================
cd /d "%~dp0Python"
call Run_Python.bat
cd /d "%~dp0"
goto menu

:all
echo.
echo ============================================
echo   先运行 MATLAB 验证...
echo ============================================
cd /d "%~dp0MATLAB"
call Run_MATLAB.bat
cd /d "%~dp0"
echo.
echo ============================================
echo   然后启动 Python 示波器...
echo ============================================
cd /d "%~dp0Python"
call Run_Python.bat
cd /d "%~dp0"
goto menu

:figures
echo.
echo 打开 MATLAB 输出目录...
explorer "%~dp0MATLAB\figures"
goto menu

:stm32
echo.
echo 打开 STM32 CubeMX 工程...
start "" "%~dp0STM32\PLL_F103.ioc"
echo.
echo 提示: 在CubeMX中点击 GENERATE CODE 生成Keil工程
echo       然后按 STM32/README.md 的步骤操作
echo.
pause
goto menu

:exit
echo.
echo 再见!
exit /b 0