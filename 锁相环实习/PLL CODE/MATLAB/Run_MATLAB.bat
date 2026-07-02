@echo off
chcp 65001 >nul
echo ============================================
echo   Software PLL - MATLAB Simulation Suite
echo   电网PLL模拟测试
echo ============================================
echo.
echo [Step 1/4] Running Case 1: Phase Jump...
matlab -nosplash -nodesktop -r "run('case1_phase_jump.m');" -wait
echo.
echo [Step 2/4] Running Case 2: Frequency Shift...
matlab -nosplash -nodesktop -r "run('case2_freq_shift.m');" -wait
echo.
echo [Step 3/4] Running Case 3: Amplitude Change...
matlab -nosplash -nodesktop -r "run('case3_amp_change.m');" -wait
echo.
echo [Step 4/4] Running Case 4: Noise...
matlab -nosplash -nodesktop -r "run('case4_noise.m');" -wait
echo.
echo ============================================
echo   All 4 cases completed!
echo   Figures saved to: .\figures\
echo   Data saved to:    .\figures\
echo ============================================
echo.
echo Opening figures folder...
start .\figures
pause
