@echo off
setlocal EnabledelayedExpansion


::process input
set command1=
set command2=
if /i "%~1"=="" (goto :helpsimple)
if /i "%~1"=="-h" (goto :help)
if /i "%~1"=="/?" (goto :help)
if /i "%~1"=="/help" (goto :help)
if /i "%~1"=="-help" (goto :help)
::set main variables
set command1=%~2
set command2=%~1
::see if colors are given
if "%~2"=="" (goto :no-color)
goto :setcolparts


:helpsimple
::simple help message
echo.
echo.
echo       Syntax: xcolor [text color] [background color]
echo       NOTICE: Two equal colors don't work
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
if /i "%command1%"=="black" set colorp1=0
if /i "%command1%"=="blue" set colorp1=1
if /i "%command1%"=="green" set colorp1=2
if /i "%command1%"=="turquoise" set colorp1=3
if /i "%command21%"=="cyan" set colorp1=3
if /i "%command1%"=="red" set colorp1=4
if /i "%command1%"=="lila" set colorp1=5
if /i "%command1%"=="yellow" set colorp1=6
if /i "%command1%"=="orange" set colorp1=6
if /i "%command1%"=="light_gray" set colorp1=7
if /i "%command1%"=="light_grey" set colorp1=7
if /i "%command1%"=="gray" set colorp1=8
if /i "%command1%"=="grey" set colorp1=8
if /i "%command1%"=="light_blue" set colorp1=9
if /i "%command1%"=="light_green" set colorp1=A
if /i "%command1%"=="light_turquoise" set colorp1=B
if /i "%command1%"=="light_red" set colorp1=C
if /i "%command1%"=="light_lila" set colorp1=D
if /i "%command1%"=="light_purple" set colorp1=D
if /i "%command1%"=="light_yellow" set colorp1=E
if /i "%command1%"=="white" set colorp1=F



::set second part of colorcode
set colorp2=none
if /i "%command2%"=="black" set colorp2=0
if /i "%command2%"=="blue" set colorp2=1
if /i "%command2%"=="green" set colorp2=2
if /i "%command2%"=="turquoise" set colorp2=3
if /i "%command2%"=="cyan" set colorp2=3

if /i "%command2%"=="red" set colorp2=4
if /i "%command2%"=="lila" set colorp2=5
if /i "%command2%"=="yellow" set colorp2=6
if /i "%command2%"=="orange" set colorp2=6
if /i "%command2%"=="light_gray" set colorp2=7
if /i "%command2%"=="light_grey" set colorp2=7
if /i "%command2%"=="gray" set colorp2=8
if /i "%command2%"=="grey" set colorp2=8
if /i "%command2%"=="light_blue" set colorp2=9
if /i "%command2%"=="light_green" set colorp2=A
if /i "%command2%"=="light_turquoise" set colorp2=B
if /i "%command2%"=="light_red" set colorp2=C
if /i "%command2%"=="light_lila" set colorp2=D
if /i "%command2%"=="light_purple" set colorp2=D
if /i "%command2%"=="light_yellow" set colorp2=E
if /i "%command2%"=="white" set colorp2=F
::test if colors are valid
if "%colorp1%"=="none" goto :no-color
if "%colorp2%"=="none" goto :no-color
::test if colors are equal
if /i "%colorp1%"=="%colorp2%" echo.&echo.&echo    Two equal colors dont work!&goto :helpsimple
goto :setcol


:no-color
::int the "errcol" variables
set "errcol1= "
set "errcol2= "
::set the "not a vakid color" messages
if /i not "%colorp1%"=="none" (set command2=none)
if /i not "%colorp2%"=="none" (set command1=none)
::echo the "not a valid color" messages
echo.
echo.
if not "%command1%"=="none" echo     "%command1%" is not a valid color^^!
if not "%command2%"=="none" echo     "%command2%" is not a valid color^^!
echo.
echo.
goto :helpsimple



:setcol
::set color
color %colorp1%%colorp2%
goto :end

:end
::Finish the process
goto :EOF
