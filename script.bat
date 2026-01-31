@echo off
setlocal enabledelayedexpansion

:: Hide the console window immediately (before any prompts)
powershell -WindowStyle Hidden -Command "$signature = '[DllImport(\"user32.dll\")] public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);'; $type = Add-Type -MemberDefinition $signature -Name Win32ShowWindow -Namespace Win32Functions -PassThru; $consolePtr = [System.Diagnostics.Process]::GetCurrentProcess().MainWindowHandle; $type::ShowWindow($consolePtr, 0)" >nul 2>&1

:: First confirmation using message box
powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('WARNING: This script will make system changes.^n^nDo you want to continue?', 'Warning', 'YesNo', 'Warning')" > %temp%\msgbox1.txt
set /p result1=<%temp%\msgbox1.txt
del %temp%\msgbox1.txt

if not "%result1%"=="Yes" (
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Operation cancelled by user.', 'Cancelled', 'OK', 'Information')" >nul
    exit /b
)

:: Second warning using message box
powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('FINAL WARNING: Are you absolutely sure you want to proceed?^n^nThis action cannot be undone.', 'Final Warning', 'YesNo', 'Exclamation')" > %temp%\msgbox2.txt
set /p result2=<%temp%\msgbox2.txt
del %temp%\msgbox2.txt

if not "%result2%"=="Yes" (
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Operation cancelled by user.', 'Cancelled', 'OK', 'Information')" >nul
    exit /b
)

echo.
echo Proceeding with script...
echo.

:: Your main script logic goes here
echo [Main script operations would go here]
echo Performing operation 1...
timeout /t 1 /nobreak >nul
echo Performing operation 2...
timeout /t 1 /nobreak >nul
echo Performing operation 3...
echo.

:: Request admin permissions
net session >nul 2>&1
if %errorlevel% == 0 (
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Administrator privileges confirmed!^n^nProceeding with script execution...', 'Admin Check', 'OK', 'Information')" >nul
    echo.
    echo [Rest of script with admin privileges would go here]
    echo.
) else (
    :: Show message box about needing admin rights
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Administrator privileges required!^n^nThe script will now restart with elevated permissions.', 'Admin Required', 'OK', 'Warning')" >nul
    
    :: Re-launch the script with admin rights
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Script completed successfully!', 'Success', 'OK', 'Information')" >nul
