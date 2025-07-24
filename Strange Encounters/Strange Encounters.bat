
::Created June 17, 2022 by (REDACTED)

<!-- : Begin batch script

@echo off
title Strange Encounters
cd data
:start
mode con cols=105 lines=17
cls
set lvl=1
set xp=0
set mxp=50
set col=0f
set qst=OFF
if exist save.bat call save.bat
color %col%
if %qst%==OFF (
ping localhost -n 2 >nul
cls
echo.
echo.
echo.
echo  Created by (REDACTED)
ping localhost -n 3 >nul
)
start /b cscript //nologo "%~f0?.wsf" //job:sound "boot.mp3"
cls
echo.
echo    _____ _                                ______                             _                
echo   / ____! !                              !  ____!                           ! !               
echo  ! (___ ! !_ _ __ __ _ _ __   __ _  ___  ! !__   _ __   ___ ___  _   _ _ __ ! !_ ___ _ __ ___ 
echo   \___ \! __! '__/ _` ! '_ \ / _` !/ _ \ !  __! ! '_ \ / __/ _ \! ! ! ! '_ \! __/ _ \ '__/ __!
echo   ____) ! !_! ! ! (_! ! ! ! ! (_! !  __/ ! !____! ! ! ! (_! (_) ! !_! ! ! ! ! !!  __/ !  \__ \
echo  !_____/ \__!_!  \__,_!_! !_!\__, !\___! !______!_! !_!\___\___/ \__,_!_! !_!\__\___!_!  !___/  v1.0
echo                               __/ !                                                           
echo                              !___/                                                            
if %qst%==OFF ping localhost -n 3 >nul
echo.
echo  [ Start ]
pause>nul
start /b cscript //nologo "%~f0?.wsf" //job:sound "select.mp3"
start /b cscript //nologo "%~f0?.wsf" //job:music "menu.mp3"
start /b cscript //nologo "%~f0?.wsf" //job:music "rain.mp3"
mode con cols=60 lines=30



:menu
call :save
if %xp% geq %mxp% goto levelup
cls
echo.
echo  -=[ Menu ]=-
echo.
echo  Level %lvl% (XP %xp%/%mxp%)
echo.
echo  1. Start
echo  2. Options
choice /c:12 /n
start /b cscript //nologo "%~f0?.wsf" //job:sound "select.mp3"
if errorlevel 2 goto opt
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:music "game.mp3"
goto game
:levelup
start /b cscript //nologo "%~f0?.wsf" //job:sound "level up.mp3"
color af
set /a xp-=%mxp%
set /a mxp+=50
set /a lvl+=1
cls
echo.
echo Level Up!
pause>nul
color %col%
goto menu



:game
set rooms=0
set levels=0
set level=1
set cr=10
set ncr=-10
set mons=0
:nlevel
cd temp
del *.* /q
set x=0
set y=0
set sta=20
set w=0
set a=0
set s=0
set d=0
(
echo set w=0
echo set a=0
echo set s=0
echo set d=0
)>0x0.bat
set msg=There are openings in all directions.
cls
echo.
echo You wake up in an empty room.
pause>nul
echo.
echo It seems there are hallways that extend infinitely.
pause>nul
echo.
echo You must find your way out.
pause>nul
set /a rounds=%level%
:round
if %rounds%==0 goto main
set /a rounds-=1
set /a r=%random% * 2 / 32768 + 1
if %r%==1 set /a rx=%random% * (%cr% - 4) / 32768 + 5
if %r%==2 set /a rx=%random% * (%cr% + 6) / 32768 + -5
set /a r=%random% * 2 / 32768 + 1
if %r%==1 set /a ry=%random% * (%cr% - 4) / 32768 + 5
if %r%==2 set /a ry=%random% * (%cr% + 6) / 32768 + -5
(
echo set w=0
echo set a=0
echo set s=0
echo set d=0
echo set mons=1
)>%rx%x%ry%.bat
goto round
:main
if %x%==%cr% goto lvlcomp
if %x%==%ncr% goto lvlcomp
if %y%==%cr% goto lvlcomp
if %y%==%ncr% goto lvlcomp
call %x%x%y%.bat
if %mons%==1 goto encoun
cls
echo.
echo  LEVEL %level%
echo.
echo  0%w%%w%%w%%w%%w%0
echo  %a%     %d%
echo  %a%  X  %d%
echo  %a%     %d%
echo  0%s%%s%%s%%s%%s%0   Pos: (%x%,%y%)
echo.
echo  Stanima: %sta%/20
echo.
echo  - %msg%
echo.
echo     [W]
echo  [A] + [D]
echo     [S]
echo.
echo  1. Interact
echo  2. Rest
echo  3. Items
echo  Q. Menu
choice /c:123qwasd /n
if errorlevel 8 (
if %sta%==0 goto needrest
if %d%==1 goto blocked
set /a sta-=1
set /a x+=1
set opp=a
goto newbox
)
if errorlevel 7 (
if %sta%==0 goto needrest
if %s%==1 goto blocked
set /a sta-=1
set /a y-=1
set opp=w
goto newbox
)
if errorlevel 6 (
if %sta%==0 goto needrest
if %a%==1 goto blocked
set /a sta-=1
set /a x-=1
set opp=d
goto newbox
)
if errorlevel 5 (
if %sta%==0 goto needrest
if %w%==1 goto blocked
set /a sta-=1
set /a y+=1
set opp=s
goto newbox
)
if errorlevel 4 goto xpcal
if errorlevel 3 goto item
if errorlevel 2 goto rest
set msg=There is nothing to interact with.
goto main
:rest
if %sta%==20 goto main
set /a starec=%random% * 16 / 32768 + 5
cls
echo.
echo You fall asleep...
ping localhost -n 4 >nul
set /a sta+=starec
echo.
echo  + %starec% Stanima Recovered
pause>nul
if %sta% gtr 20 set sta=20
goto main
:item
set c=q
cls
echo.
echo  -=[ Items ]=-
echo.
echo.
echo  Q. Back
echo.
set /p c=">> "
if "%c%"=="q" goto main
goto item
:newbox
set msg=
if exist %x%x%y%.bat goto main
set /a w=%random% * 2 / 32768 + 0
set /a a=%random% * 2 / 32768 + 0
set /a s=%random% * 2 / 32768 + 0
set /a d=%random% * 2 / 32768 + 0
set /a %opp%=0
(
echo set w=%w%
echo set a=%a%
echo set s=%s%
echo set d=%d%
)>%x%x%y%.bat
::set /a e=%random% * 100 / 32768 + 1
::if %e%==1
set /a rooms+=1
goto main
:needrest
set msg=You have no stanima.
goto main
:blocked
set msg=You can't go that way.
goto main
:encoun
set mons=0
cls
echo.
echo You've encountered an unidentified creature!
ping localhost -n 4 >nul
echo.
echo You attempt to escape...
set /a r=%random% * 2 / 32768 + 1
ping localhost -n 3 >nul
if %r%==1 (
echo.
echo You escaped!
pause>nul
(
echo set w=0
echo set a=0
echo set s=0
echo set d=0
)>%x%x%y%.bat
goto main
)
cls
cd ..
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:sound "death.mp3"
start /b cscript //nologo "%~f0?.wsf" //job:music "rain.mp3"
start /b cscript //nologo "%~f0?.wsf" //job:music "end.mp3"
color 4e
cls
echo.
echo You were slain...
ping localhost -n 3 >nul
cd temp
pause>nul
color %col%
goto xpcal
:lvlcomp
cd ..
start /b cscript //nologo "%~f0?.wsf" //job:sound "collect.mp3"
set /a level+=1
set /a levels+=1
set /a cr+=5
set /a ncr-=5
cls
echo.
echo Level Complete!
pause>nul
goto nlevel
:xpcal
cd ..
set /a tot=%rooms% + (%levels%*50)
cls
echo.
start /b cscript //nologo "%~f0?.wsf" //job:sound "collect.mp3"
echo Rooms Explored: %rooms% x 1 XP
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:sound "collect.mp3"
echo Levels Complete: %levels% x 50 XP
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:sound "collect.mp3"
echo.
echo Total XP: %tot%
pause>nul
set /a xp+=%tot%
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:music "menu.mp3"
start /b cscript //nologo "%~f0?.wsf" //job:music "rain.mp3"
goto menu



:opt
cls
echo.
echo  -=[ Options ]=-
echo.
echo  1. Help
echo  2. Color
echo  3. Quick Startup: %qst%
echo  4. Changelog
echo  5. Reset Data
echo  Q. Back
choice /c:12345q /n
start /b cscript //nologo "%~f0?.wsf" //job:sound "select.mp3"
if errorlevel 6 goto menu
if errorlevel 5 (
cls
echo.
echo  -=[ Reset Data ]=-
echo.
echo Are you sure? [Y/N]
choice /n
if errorlevel 2 goto opt
del /f /q save.bat
start /b cscript //nologo "%~f0?.wsf" //job:kill
goto start
)
if errorlevel 4 (
cls
echo.
echo  -=[ Changelog ]=-
echo.
echo ====== v1.0 ======= 6/17/22
echo.
echo - Initial release
pause>nul
goto opt
)
if errorlevel 3 (
if %qst%==ON (
set qst=OFF
goto opt
)
set qst=ON
goto opt
)
if errorlevel 2 (
cls
echo.
echo  -=[ Color ]=-
echo.
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
choice /c:1234567890abcdefq /n /m "Background:"
if errorlevel 17 goto opt
if errorlevel 16 set c1=f&goto color2
if errorlevel 15 set c1=e&goto color2
if errorlevel 14 set c1=d&goto color2
if errorlevel 13 set c1=c&goto color2
if errorlevel 12 set c1=b&goto color2
if errorlevel 11 set c1=a&goto color2
if errorlevel 10 set c1=0&goto color2
set c1=%errorlevel%
:color2
choice /c:1234567890abcdefq /n /m "Font:"
if errorlevel 17 goto opt
if errorlevel 16 set c2=f&goto colorset
if errorlevel 15 set c2=e&goto colorset
if errorlevel 14 set c2=d&goto colorset
if errorlevel 13 set c2=c&goto colorset
if errorlevel 12 set c2=b&goto colorset
if errorlevel 11 set c2=a&goto colorset
if errorlevel 10 set c2=0&goto colorset
set c2=%errorlevel%
:colorset
set col=%c1%%c2%
color %col%
goto opt
)
cls
echo.
echo  -=[ Help ]=-
echo.
echo - Returning to the Menu saves progress.
echo - Exitting the game without returning to the menu first will result in data loss.
pause>nul
goto opt



:save
(
echo set lvl=%lvl%
echo set xp=%xp%
echo set mxp=%mxp%
echo set col=%col%
echo set qst=%qst%
)>save.bat
title Strange Encounters
goto :eof



----- Begin wsf script --->

<package>
  <job id="music">
    <script language="VBScript">
      Set Sound = CreateObject("WMPlayer.OCX.7")
      Sound.URL = WScript.Arguments.Item(0)
      Sound.settings.volume = 100
      Sound.settings.setMode "loop", True
      Sound.Controls.play
      While Sound.playState <> 1
      WScript.Sleep 100
      Wend
    </script>
  </job>
    <job id="sound">
    <script language="VBScript">
      Set Sound = CreateObject("WMPlayer.OCX.7")
      Sound.URL = WScript.Arguments.Item(0)
      Sound.Controls.play
      do while Sound.currentmedia.duration = 0
      wscript.sleep 100
      loop
      wscript.sleep (int(Sound.currentmedia.duration)+1)*1000
    </script>
  </job>
  <job id="kill">
    <script language="VBScript">
      Option Explicit
      Dim WshShell
      Set WshShell = WScript.CreateObject("WScript.Shell")
      WshShell.Run "taskkill /f /im Cscript.exe", , True
      WshShell.Run "taskkill /f /im wscript.exe", , True
	</script>
  </job>
</package>