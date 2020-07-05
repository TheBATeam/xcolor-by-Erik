@Echo off
cls

Title xColor - Demo - www.thebateam.org
Set "Path=%Path%;%cd%;%cd%\files"
Color 0a
Mode 80,25

:Main
Cls
Echo.
Echo.
Echo. Writing the Text in Different Colors...
Call Xcolor gray black
timeout /t 2 >nul
Call Xcolor green black
timeout /t 2 >nul
Call Xcolor blue black
pause
exit