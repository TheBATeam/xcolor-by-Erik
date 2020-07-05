@echo off
setlocal EnabledelayedExpansion


::process input
set "command1="
set "command2="
if /i "%~1"=="" (goto :helpsimple)
if /i "%~1"=="-h" (goto :help)
if /i "%~1"=="/?" (goto :help)
if /i "%~1"=="/help" (goto :help)
if /i "%~1"=="-help" (goto :help)
::set main variables
set command1=%~2
set command2=%~1
::look for easteregg
if %~1%~2==easteregg goto :easteregg
::see if colors are given
if "%command1%"=="" (goto :no-color)
if "%command2%"=="" (goto :no-color)
goto :setcolparts


:helpsimple
::simple help message
echo.
echo.
echo       Syntax: xcolor [text color] [background color]
echo       NOTICE: two equal colors dont work
echo.
echo.
echo          "black" "blue" "green" "turquoise" "red" "lila" "yellow" "gray" "white"
echo          "light_gray" "light_blue" "light_green" "light_turquoise" "light_red" "light_lila" "light_yellow"
echo.
echo.
goto :end


:help
::help message
echo.
echo.
echo.
echo      Plugin by Erik.
echo.
echo      This plugin simply makes the use of the "color" command easier.
echo.
echo.
echo            Syntax: call xcolor [text color] [background color]    ^|   set the colors NOTICE: two equal colors dont work
echo            Syntax: call xcolor [help ^| /^? ^| -h ^| -help]           ^|   get this message
echo            Syntax: call xcolor                                    ^|   get the colors (as seen below)
echo.
echo.
echo.
echo.
echo.
echo       Colors
echo.
echo.
echo       "black" "blue" "green" "turquoise" "red" "lila" "yellow" "gray" "white"
echo       "light_gray" "light_blue" "light_green" "light_turquoise" "light_red" "light_lila" "light_yellow"
echo.
echo.
goto :end


:setcolparts
::set first part of colorcode
set colorp1=none
if %command1%==black set colorp1=0
if %command1%==blue set colorp1=1
if %command1%==green set colorp1=2
if %command1%==turquoise set colorp1=3
if %command1%==red set colorp1=4
if %command1%==lila set colorp1=5
if %command1%==yellow set colorp1=6
if %command1%==light_gray set colorp1=7
if %command1%==gray set colorp1=8
if %command1%==light_blue set colorp1=9
if %command1%==light_green set colorp1=A
if %command1%==light_turquoise set colorp1=B
if %command1%==light_red set colorp1=C
if %command1%==light_lila set colorp1=D
if %command1%==light_yellow set colorp1=E
if %command1%==white set colorp1=F
::set second part of colorcode
set colorp2=none
if %command2%==black set colorp2=0
if %command2%==blue set colorp2=1
if %command2%==green set colorp2=2
if %command2%==turquoise set colorp2=3
if %command2%==red set colorp2=4
if %command2%==lila set colorp2=5
if %command2%==yellow set colorp2=6
if %command2%==light_gray set colorp2=7
if %command2%==gray set colorp2=8
if %command2%==light_blue set colorp2=9
if %command2%==light_green set colorp2=A
if %command2%==light_turquoise set colorp2=B
if %command2%==light_red set colorp2=C
if %command2%==light_lila set colorp2=D
if %command2%==light_yellow set colorp2=E
if %command2%==white set colorp2=F
::test if colors are valid
if %colorp1%==none goto :no-color
if %colorp2%==none goto :no-color
::test if colors are equal
if %colorp1%==%colorp2% echo.&echo.&echo    Two equal colors dont work!&goto :helpsimple
goto :setcol


:no-color
::int the "errcol" variables
set "errcol1= "
set "errcol2= "
::set the "not a vakid color" messages
if %colorp1%==none (set errcol1="%command1%" is not a valid color!)
if %colorp2%==none (set errcol2="%command2%" is not a valid color!)
if not %colorp1%==none (set command2=none)
if not %colorp2%==none (set command1=none)
::echo the "not a valid color" messages
echo.
echo.
if not "%command1%"=="none" echo     %errcol2%
if not "%command2%"=="none" echo     %errcol1%
echo.
echo.
goto :helpsimple



:setcol
::set color
color %colorp1%%colorp2%
goto :end


:easteregg
::just a random easteregg
cls
echo.
echo.
echo           I thInk yoU BroKe s0metHinG...
:easterloop
color 4f
timeout /t 1 /nobreak>NUL
color 2f
timeout /t 1 /nobreak>NUL
color 1f
timeout /t 1 /nobreak>NUL
goto :easterloop



:end
::Finish the process
goto :EOF