
<!-- : Begin batch script

@echo off
mode con cols=75 lines=25
title The Phantom Realm Rush
cd data
start /b cscript //nologo "%~f0?.wsf" //job:music "main.mp3"
:reset
call :resetstats
set levels=0
set dmg=0
set spells=0
set xpearn=0
set mearn=0
set breadc=0
set xpboostc=0
set defboostc=0
set shopbgm=ON
set col=0f
if exist save.bat call save.bat
color %col%



:menu
call :save
cls
if %hp% leq 0 goto died
if %xp% geq %mxp% goto levelup
echo.
echo  -=[ Menu ]=-
echo.
call :statsdisplay
echo.
echo  1. Battle
echo  2. Shop
echo  3. Blacksmith
echo  4. Items
::echo  5. Teleport
echo  Q. Options
if %hp% leq 25 (
start /b cscript //nologo "%~f0?.wsf" //job:sound "low.mp3"
echo.
echo  ! LOW HEALTH !
)
choice /c:1234q /n
if errorlevel 5 goto opt
::if errorlevel 5 goto tele
if errorlevel 4 goto item
if errorlevel 3 goto smith
if errorlevel 2 (
if %shopbgm%==ON (
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:music "rain.mp3"
start /b cscript //nologo "%~f0?.wsf" //job:music "shop.mp3"
)
goto shop
)



::battle
start /b cscript //nologo "%~f0?.wsf" //job:sound "kill.mp3"
set /a gxp=%random% *(%xpgainmax% - %xpgainmin% + 1) /32768 +%xpgainmin%
if %xpb% gtr 0 if %mp% lss 100 set /a gxp*=2&set /a xpb-=1
if %mp%==100 set /a gxp*=3
set /a gm=%random% *(%mgainmax% - %mgainmin% + 1) /32768 +%mgainmin%
if %mp%==100 set /a gm*=3
set /a dhp=%random% *(%hplossmax% - %hplossmin% + 1) /32768 +%hplossmin%
if %defb% gtr 0 set /a dhp/=2&set /a defb-=1
set /a xp+=%gxp%
set /a xpearn+=%gxp%
set /a m+=%gm%
set /a mearn+=%gm%
set /a hp-=%dhp%
set /a dmg+=%dhp%
cls
echo.
echo  -=[ Fighting... ]=-
ping localhost -n 2 >nul
echo.
if %mp%==100 echo  -{ MAGIC BONUS }-&set mp=0&set /a spells+=1
echo  - %dhp% HP
echo  + %gxp% XP
echo  + %gm% R$
set /a mp+=%dhp%
if %mp% gtr 100 set mp=100
call :save
pause>nul
goto menu
:levelup
start /b cscript //nologo "%~f0?.wsf" //job:sound "level up.mp3"
set /a levels+=1
set xp=0
set /a mxp+=100
set /a lvl+=1
set /a m+=100
set /a mhp+=20
set /a hp=%mhp%
color af
echo.
echo  -=[ Level Up ]=-
ping localhost -n 2 >nul
echo.
echo  + 100 R$
echo  + 20 Max HP
pause>nul
color %col%
goto menu
:died
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:sound "death.mp3"
start /b cscript //nologo "%~f0?.wsf" //job:music "rain.mp3"
start /b cscript //nologo "%~f0?.wsf" //job:music "end.mp3"
color 4e
cls
echo.
echo  -=[ YOU DIED ]=-
echo.
echo  You reached Lvl %lvl%
ping localhost -n 4 >nul
echo.
echo.
echo Try again..?
pause>nul
cls
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:music "main.mp3"
call :resetstats
color %col%
goto menu



:shop
cls
echo.
echo  -=[ Shop ]=-
echo.
call :statsdisplay
echo.
echo  1. Bread (Restores 25 HP) - 20 R$
echo  2. XP Boost (x2 XP for 3 battles) - 100 R$
echo  3. Defense Boost (Take x2 less damage for 3 battles) - 150 R$
echo  Q. Back
choice /c:123q /n
if errorlevel 4 (
if %shopbgm%==ON (
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:music "main.mp3"
)
goto menu
)
if errorlevel 3 (
if %m% lss 150 goto shop
set /a m-=150
set /a defboost+=1
goto shop
)
if errorlevel 2 (
if %m% lss 100 goto shop
set /a m-=100
set /a xpboost+=1
goto shop
)
if %m% lss 20 goto shop
set /a m-=20
set /a bread+=1
goto shop



:smith
cls
echo.
echo  -=[ Blacksmith ]=-
echo.
call :statsdisplay
echo.
echo  1. Upgrade Attack - 1 Gem
echo  2. Upgrade Defense - 1 Gem
echo  3. Upgrade Capitalism - 1 Gem
echo  4. Upgrade Experiencer - 1 Gem
echo  Q. Back
choice /c:1234q /n
if errorlevel 5 goto menu
if errorlevel 4 (
if %g% lss %ue% goto smith
set /a g-=%ue%
set /a xpgainmin+=5
set /a xpgainmax+=6
goto smith
)
if errorlevel 3 (
if %g% lss %ue% goto smith
set /a g-=%ue%
set /a mgainmin+=4
set /a mgainmax+=5
goto smith
)
if errorlevel 2 (
if %g% lss %ue% goto smith
set /a g-=%ue%
set /a xpgainmin+=3
set /a xpgainmax+=4
goto smith
)
if %g% lss %ue% goto smith
set /a g-=%ue%
set /a xpgainmin+=3
set /a xpgainmax+=4
goto smith



:item
if %hp% gtr %mhp% set /a hp=%mhp%
cls
echo.
echo  -=[ Items ]=-
echo.
call :statsdisplay
echo.
if %bread% gtr 0 echo  1. Bread (Restores 25 HP) - %bread%
if %xpboost% gtr 0 echo  2. XP Boost (x2 XP for 3 battles) - %xpboost% (Stackable)
if %defboost% gtr 0 echo  3. Defense Boost (Take x2 less damage for 3 battles) - %defboost% (Stackable)
echo.
echo  Q. Back
choice /c:123q /n
if errorlevel 4 goto menu
if errorlevel 3 (
if %defboost%==0 goto item
start /b cscript //nologo "%~f0?.wsf" //job:sound "use.mp3"
set /a defboostc+=1
set /a defboost-=1
set /a defb+=3
goto item
)
if errorlevel 2 (
if %xpboost%==0 goto item
start /b cscript //nologo "%~f0?.wsf" //job:sound "use.mp3"
set /a xpboostc+=1
set /a xpboost-=1
set /a xpb+=3
goto item
)
if %bread%==0 goto item
start /b cscript //nologo "%~f0?.wsf" //job:sound "use.mp3"
set /a breadc+=1
set /a bread-=1
set /a hp+=25
goto item



:opt
cls
echo.
echo  -=[ Options ]=-
echo.
echo  1. Color
echo  2. Stats
echo  3. Shop Music: %shopbgm%
echo  4. Changelog
echo  5. Reset Data
echo  Q. Back
choice /c:12345q /n
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
goto reset
)
if errorlevel 4 (
cls
echo.
echo  -=[ Changelog ]=-
echo.
echo ====== v2.0 ======= 6/18/22
echo.
echo - Brand new gameplay and ui + music
echo.
echo ====== v1.0 ======= 4/25/21
echo.
echo - Initial release
pause>nul
goto opt
)
if errorlevel 3 (
if %shopbgm%==ON (
set shopbgm=OFF
goto opt
)
set shopbgm=ON
goto opt
)
if errorlevel 2 (
cls
echo.
echo  -=[ Stats ]=-
echo.
echo  Levels Gained: %levels%
echo  Damage Taken: %dmg%
echo  Spells Used: %spells%
echo  XP Gained: %xpearn%
echo  R$ Earned: %mearn%
echo  Bread Used: %breadc%
echo  XP Boosts Used: %xpboostc%
echo  Def Boosts Used: %defboostc%
pause>nul
goto opt
)
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



:statsdisplay
echo  Lvl %lvl%
echo  HP: %hp%/%mhp%
echo  MP: %mp%/100
echo  XP: %xp%/%mxp%
echo  R$: %m%
if %xpb% gtr 0 echo  (XP Boost Active)
if %defb% gtr 0 echo  (Def Boost Active)
goto :eof
:resetstats
set hp=100
set mhp=100
set mp=0
set xp=0
set mxp=50
set lvl=1
set m=0
set bread=0
set xpboost=0
set defboost=0
set xpb=0
set defb=0
set xpgainmax=20
set xpgainmin=5
set hplossmax=25
set hplossmin=5
set mgainmax=20
set mgainmin=10
goto :eof
:save
(
echo set hp=%hp%
echo set mhp=%mhp%
echo set mp=%mp%
echo set xp=%xp%
echo set mxp=%mxp%
echo set lvl=%lvl%
echo set m=%m%
echo set bread=%bread%
echo set xpboost=%xpboost%
echo set defboost=%defboost%
echo set xpb=%xpb%
echo set defb=%defb%
echo set xpgainmax=%xpgainmax%
echo set xpgainmin=%xpgainmin%
echo set hplossmax=%hplossmax%
echo set hplossmin=%hplossmin%
echo set mgainmax=%mgainmax%
echo set mgainmin=%mgainmin%
echo set levels=%levels%
echo set dmg=%dmg%
echo set spells=%spells%
echo set xpearn=%xpearn%
echo set mearn=%mearn%
echo set breadc=%breadc%
echo set xpboostc=%xpboostc%
echo set defboostc=%defboostc%
echo set shopbgm=%shopbgm%
echo set col=%col%
)>save.bat
goto :eof



----- Begin wsf script --->

<package>
  <job id="music">
    <script language="VBScript">
      Set Sound = CreateObject("WMPlayer.OCX.7")
      Sound.URL = WScript.Arguments.Item(0)
      Sound.settings.volume = 50
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