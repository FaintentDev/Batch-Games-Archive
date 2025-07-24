@echo off
setLocal EnableDelayedExpansion
title W.A.I.F.U. a terminal assistant
cd /d "%~dp0"
::opt
set name=%username%
set waifu=WAIFU
set qas=0
set color=0f
call opt.bat
color %color%
::start
echo.
echo  W.A.I.F.U. v1.0-alpha
echo.
set m=0
for /f "delims=" %%i in (ascii.txt) do (
if "%%i"=="#" set /a m+=1
)
set /a r=%random%
set /a r=%random% * %m% / 32768 + 1
set a=0
for /f "delims=" %%i in (ascii.txt) do (
if "!a!"=="%r%" if not "%%i"=="#" echo %%i
if "%%i"=="#" set /a a+=1
)
::time
set hour=%time:~0,2%
set timep=morning
if %hour% gtr 11 set timep=afternoon
if %hour% gtr 16 set timep=evening
if %hour% gtr 20 set timep=night
set timem=AM
if %hour% gtr 11 set timem=PM
if %hour% lss 10 set hour=%time:~1,1%
if %hour% gtr 12 set /a hour-=12
set min=%time:~3,2%
set p=Good %timep%, %name%
echo.
echo  * %date% * %hour%:%min% %timem% *

:prompt
set c=
if defined p (
echo.
echo %waifu%: %p%^^!
)
echo.
set /p c="%name%> "
call :cls
echo.
set p=
if not defined c goto qa
if "%c%"=="help" goto help
if "%c%"=="cmd" goto cmd
if "%c%"=="time" goto time
if "%c%"=="date" goto date
if "%c%"=="apps" goto apps
if "%c%"=="games" goto games
if "%c:~0,6%"=="telnet" goto telnet
if "%c:~0,5%"=="color" goto color
if "%c:~0,4%"=="name" goto name
if "%c%"=="hi" goto chat
if "%c%"=="hello" goto chat
if "%c%"=="cls" call :cls&goto prompt
if "%c%"=="q" goto exit
set p=Invalid command
call :cls
goto prompt

:qa
echo Quick Access: "add" to create a new shortcut, "del [#]" to remove a shortcut
echo.
if %qas%==0 goto qaskip
set r=0
:qas
set /a r+=1
call qa.bat qa%r%
echo (%r%) %qaname%
if not %r%==%qas% goto qas
:qaskip
set /p c="> "
if "%c%"=="add" goto qanew
if "%c:~0,3%"=="del" goto qadel
set qadir=
if defined c call qa.bat qa%c%
if defined qadir (
start "" "%qadir%"
set p=Running "%qaname%"
)
call :cls
goto prompt
:qanew
echo.
set qaname=
set qadir=
set /p qaname="Name> "
if not defined qaname goto prompt
set /p qadir="Directory/Link> "
if not defined qadir goto prompt
set /a r=%qas%+1
(
echo.
echo :qa%r%
echo set qaname=%qaname%
echo set qadir=%qadir%
echo goto :eof
)>>qa.bat
set /a qas+=1
call :saveopt
echo.
set p=Added "%qaname%"
goto prompt
:qadel
set c=%c:~4%
if not defined c set /p c="Number: "
echo goto %%1%>qa2.bat
set r=0
set t=0
:qad
set /a r+=1
if not %r%==%c% call :qa2
if not %r%==%qas% goto qad
del qa.bat
ren qa2.bat qa.bat
set /a qas-=1
call :saveopt
set p=Removed %c%
goto prompt
:qa2
set /a t+=1
call qa.bat qa%r%
(
echo.
echo :qa%t%
echo set qaname=%qaname%
echo set qadir=%qadir%
echo goto :eof
)>>qa2.bat
goto :eof

:help
echo %waifu%: Here is a list of all commands:
echo.
echo v1.0-alpha
echo - cmd: command prompt mode
echo - time: displays the current time
echo - date: displays the current date
echo - apps: browse the apps directory
echo - games: browse the games directory
echo - url [*]: browse the internet bookmarks directory / open a link
echo - telnet [*]: prompts to choose a telnet from telnets.txt
echo - color [*]: prompts to choose a color
echo - name [*]: set your name
echo - cls: clears the screen
echo - q: exit the batch program
goto prompt

:cmd
echo %waifu%: Entered CMD Mode. "exit" to quit
:cmdprompt
echo.
set /p c="%cd%> "
if "%c%"=="exit" call :cls&goto prompt
echo.
%c%
goto cmdprompt

:time
time /t
goto prompt

:date
date /t
goto prompt

:apps
:games
cd .folders\%c%
:direxplorer
call :cls
echo.
for %%I in (.) do echo %%~nxI
echo.
set /a r=0
for /f "delims=" %%i in ('dir /ad /b 2^>nul') do (
	set /a r+=1
	echo !r!. [%%i]
)
for /f "delims=" %%i in ('dir /a-d /b 2^>nul') do (
	set /a r+=1
	echo !r!. %%i
)
set c=
set /p c="> "
set /a r=0
for /f "delims=" %%i in ('dir /ad /b') do (
	set /a r+=1
	if "!r!"=="%c%" cd "%%i"
)
for /f "delims=" %%i in ('dir /a-d /b') do (
	set /a r+=1
	if "!r!"=="%c%" start "" "%%i"
)
if not defined c cd ..
for %%I in (.) do if "%%~nxI"==".folders" (
	cd ..
	call :cls
	goto prompt
)
goto direxplorer

:telnet
set t=%c:~7%
if defined t goto telnetcon
echo Note: If the command isn't recognized, you might have to enable telnet. Search Start or the Control Panel for "Turn Windows features on or off" and check the box next to Telnet (click Ok...).
echo.
set r=0
set e=1
for /f "delims=" %%i in (telnets.txt) do (
if !e!==1 (
set /a r+=1
set e=0
echo !r!. %%i
) else (
set e=1
))
set /p c="> "
set r=0
set e=0
for /f "delims=" %%i in (telnets.txt) do (
if !e!==1 (
set /a r+=1
set e=0
if "!r!"=="%c%" set t=%%i
if defined t goto telnetcon
) else (
set e=1
))
call :cls
goto prompt
:telnetcon
telnet %t%
echo.
choice /n /m "Reconnect? [Y/N]"
if errorlevel 2 call :cls&goto prompt
goto telnetcon

:color
set c=%c:~6%
if defined c (
set color=%c%
color !color!
call :saveopt
set p=Color set
call :cls
goto prompt
)
echo  ====================================
echo    0 = Black       8 = Gray
echo    1 = Blue        9 = Light Blue
echo    2 = Green       A = Light Green
echo    3 = Aqua        B = Light Aqua
echo    4 = Red         C = Light Red
echo    5 = Purple      D = Light Purple
echo    6 = Yellow      E = Light Yellow
echo    7 = White       F = Bright White
echo.
echo    Q = Back
echo  ====================================
echo.
choice /c:1234567890abcdefq /n /m "Background: "
if errorlevel 17 goto prompt
if errorlevel 16 set c1=f&goto color2
if errorlevel 15 set c1=e&goto color2
if errorlevel 14 set c1=d&goto color2
if errorlevel 13 set c1=c&goto color2
if errorlevel 12 set c1=b&goto color2
if errorlevel 11 set c1=a&goto color2
if errorlevel 10 set c1=0&goto color2
set c1=%errorlevel%
:color2
choice /c:1234567890abcdefq /n /m "Text: "
if errorlevel 17 goto prompt
if errorlevel 16 set c2=f&goto colorset
if errorlevel 15 set c2=e&goto colorset
if errorlevel 14 set c2=d&goto colorset
if errorlevel 13 set c2=c&goto colorset
if errorlevel 12 set c2=b&goto colorset
if errorlevel 11 set c2=a&goto colorset
if errorlevel 10 set c2=0&goto colorset
set c2=%errorlevel%
:colorset
set color=%c1%%c2%
color %color%
call :saveopt
set p=Color set
call :cls
goto prompt

:name
set c=%c:~5%
if not defined c set /p c="Name: "
set name=%c%
call :saveopt
set p=Name set to %name%
goto prompt

:chat
if "%c%"=="hi" set p=Hi there
if "%c%"=="hello" set p=o/
goto prompt

:exit
echo %waifu%: Come back soon~
timeout 1 >nul
exit

:cls
set hour=%time:~0,2%
set timem=AM
if %hour% gtr 11 set timem=PM
if %hour% lss 10 set hour=%time:~1,1%
if %hour% gtr 12 set /a hour-=12
set min=%time:~3,2%
cls
echo.
echo  * %date% * %hour%:%min% %timem% *
goto :eof

:saveopt
(
echo set name=%name%
echo set waifu=%waifu%
echo set qas=%qas%
echo set color=%color%
)>opt.bat
goto :eof