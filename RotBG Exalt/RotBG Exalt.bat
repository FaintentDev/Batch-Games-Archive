::*****************************************************************************************************::
::                           Created December 1, 2021 by FaintentDev                                 ::
::  Based off of the MMORPG Realm of the Mad God - https://www.realmeye.com/wiki/realm-of-the-mad-god  ::
::*****************************************************************************************************::

<!-- : Begin batch script

@echo off
mode con cols=60 lines=25
title Realm of the Batch God
set rem=[OFF]
(
set /p rem=
set /p user=
)<"RotBG Exalt.data"
if not exist "users" md "users"
cd "users"
if %rem%==[ON] (
if exist "%user%" (
cd "%user%"
call :load
goto renexus )
)

:reset
cd ..
cd audio
start /b cscript //nologo "%~f0?.wsf" //job:music "start.mp3"
cd ..
cd users
:start
color 0c
set daily=0
set day=0
set stars=0
set char=Character 1
set cc=0f
set bfame=1
set bfameq=50
set fame=0
set lvl=1
set xp=0
set xpmax=50
set newcharcost=500
cls
echo  ______      _  ______ _____    _____          _ _
echo  � ___ �    � � � ___ \  __ \  �  ___�        � � �
echo  � �_/ /___ � �_� �_/ / �  \/  � �____  ____ _� � �_
echo  �    // _ \\ __� ___ \ � __   �  __\ \/ / _` � � __�
echo  � �\ � (_) � \_� �_/ / �_\ \  � �___)  ( (_� � � �_
echo  \_� \_\___/ \__\____/ \____/  \____/_/\_\__,_�_�\__�
echo.
echo  1. Login
echo  2. Sign Up
echo  Q. Exit
choice /c:12q /n
if errorlevel 3 exit
if errorlevel 2 goto signup
cls
echo.
echo Login
echo.
set /p user="Username: "
if not exist "%user%" (
echo User not found.
pause>nul
goto start
)
cd "%user%"
call :load
set /p password="Password: "
if not "%password%"=="%pass%" (
echo Incorrect password.
cd ..
pause>nul
goto start )
goto renexus
:signup
cls
echo.
echo Sign Up
echo.
set /p user="Username: "
if exist "%user%" (
echo That username already exists.
pause>nul
goto start
)
set /p pass="Password: "
md "%user%"
cd "%user%"
goto renexus



:createchar
cls
echo New Character
echo.
echo Select a Class:
echo 1. Rogue
echo 2. Archer
echo 3. Wizard
echo 4. Priest
echo 5. Warrior
echo 6. Knight
echo 7. Paladin
echo 8. Assassin
echo 9. Necromancer
echo 10. Huntress
echo 11. Mystic
echo 12. Trickster
echo 13. Sorcerer
echo 14. Ninja
echo 15. Samurai
echo 16. Bard
echo 17. Summoner
echo 18. Kensei
echo.
set /p temp=">> "
if %temp%==1 (
set class=Rogue
set hp=150
set mp=100
set att=10
set def=0
set spd=15
set dex=15
set vit=15
set wis=10
call :save
goto nexus
)
if %temp%==2 (
set class=Archer
set hp=130
set mp=100
set att=12
set def=0
set spd=12
set dex=12
set vit=12
set wis=10
call :save
goto nexus
)
if %temp%==3 (
set class=Wizard
set hp=100
set mp=100
set att=12
set def=0
set spd=10
set dex=15
set vit=12
set wis=12
call :save
goto nexus
)
if %temp%==4 (
set class=Priest
set hp=100
set mp=100
set att=12
set def=0
set spd=12
set dex=12
set vit=10
set wis=15
call :save
goto nexus
)
goto createchar



:renexus
color %cc%
cls
echo.
echo  Nexus ...
cd ..
cd ..
cd audio
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:music "menu.mp3"
cd ..
cd users
cd "%user%"
:nexus
color %cc%
if not exist "%char%.sav" goto createchar
call :save
if %xp% gtr %xpmax% call :levelup
cls
echo ====================
echo  %user% / %stars% star
echo   = %class% %lvl% =
if %lvl% lss 20 echo  Lvl %lvl% (EXP %xp%/%xpmax%)
if %lvl%==20 echo  Base Fame %bfame%/%bfameq% (EXP %xp%/2000)
echo ====================
echo.
echo  Nexus (autosave)
echo.
echo  1. Realm Portal
echo  2. Inventory
echo  3. Vault
echo  4. Quests
echo  5. Pet Yard
echo  Q. Options
choice /c:12345q /n
if errorlevel 6 goto opt
if errorlevel 5 goto petyard
if errorlevel 4 goto quests
if errorlevel 3 goto vault
if errorlevel 2 (
call :inv
goto nexus
)



:rerealm
cls
echo.
echo  Realm of the Batch God ...
cd ..
cd ..
cd audio
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:music "realm.mp3"
cd ..
cd users
cd "%user%"
:realm
call :save
cls
echo.
echo  Realm - %area%
echo.
echo  [ Quest: Scorpion Queen ]
echo.
echo  1. Fight
echo  2. Inventory
echo  3. Run to Next Area
echo  Q. Nexus
choice /c:123q /n
if errorlevel 4 goto renexus
if errorlevel 3 (
cls
echo.
echo Sorry, this feature is not avalible yet!
pause>nul
goto realm
)
if errorlevel 2 (
call :inv
goto realm
)
if %area%==shoreline
set /a r=%random% * (13 - 1 + 1) /32768 + 1
if %r%==1 




:inv
cls
echo.
echo Sorry, this feature is not avalible yet!
pause>nul
goto :eof
:vault
cls
echo.
echo Sorry, this feature is not avalible yet!
pause>nul
goto nexus
:quests
cls
echo.
echo Sorry, this feature is not avalible yet!
pause>nul
goto nexus
:petyard
cls
echo.
echo Sorry, this feature is not avalible yet!
pause>nul
goto nexus
::beta feature
cls
echo.
echo  Pet Yard
echo.
echo  1. Switch
echo  2. Feed
echo  Q. Nexus
choice /c:12q
goto nexus
:opt
call :save
cls
echo.
echo  Options
echo.
echo  1. Stats
echo  2. Color
echo  3. Characters
echo  4. Account Settings
echo  Q. Back
choice /c:1234q /n
if errorlevel 5 goto nexus
if errorlevel 4 goto acc
if errorlevel 3 goto char
if errorlevel 2 goto color
:stats
cls
echo.
echo Sorry, this feature is not avalible yet!
pause>nul
goto opt
:color
cls
echo.
echo  Color
echo.
echo  ===================================
echo   0 = Black       8 = Gray
echo   1 = Blue        9 = Light Blue
echo   2 = Green       A = Light Green
echo   3 = Aqua        B = Light Aqua
echo   4 = Red         C = Light Red
echo   5 = Purple      D = Light Purple
echo   6 = Yellow      E = Light Yellow
echo   7 = White       F = Bright White
echo.
echo   Q = Back
echo  ===================================
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
set cc=%c1%%c2%
color %cc%
goto opt
:char
cls
echo.
echo  { %fame% Fame }
echo.
echo  Characters
echo.
echo  - %Character 1%
if exist "Character 2.sav" echo  - %Character 2%
if exist "Character 3.sav" echo  - %Character 3%
if exist "Character 4.sav" echo  - %Character 4%
if exist "Character 5.sav" echo  - %Character 5%
echo.
echo  1. New Character (%newcharcost% Fame)
echo  2. Switch Characters
echo  3. Delete Character
echo  Q. Back
choice /c:123q /n
if errorlevel 4 goto opt
if errorlevel 3 goto chardel
if errorlevel 2 goto charselect
:newchar
if %fame% lss %newcharcost% goto char
set /a fame-=%newcharcost%
set /a newcharcost+=500
goto createchar
:charselect
cls
echo.
echo  Character Select:
echo.
echo  1. %Character 1%
if exist "Character 2.sav" echo  2. %Character 2%
if exist "Character 3.sav" echo  3. %Character 3%
if exist "Character 4.sav" echo  4. %Character 4%
if exist "Character 5.sav" echo  5. %Character 5%
echo.
echo  Q. Back
choice /c:12345q /n
if errorlevel 6 goto char
set /a temp=%errorlevel%
if not exist "Character %temp%.sav" goto charselect
set char=Character %temp%
call :load
goto nexus
:chardel
cls
echo.
echo  Delete Character:
echo.
echo  1. %Character 1%
if exist "Character 2.sav" echo  2. %Character 2%
if exist "Character 3.sav" echo  3. %Character 3%
if exist "Character 4.sav" echo  4. %Character 4%
if exist "Character 5.sav" echo  5. %Character 5%
echo.
echo  Q. Back
choice /c:12345q /n
if errorlevel 6 goto char
set /a temp=%errorlevel%
if not exist "Character %temp%.sav" goto chardel
echo.
echo Are you sure? Character %temp% will be deleted. [Y/N]
choice /n
if errorlevel 2 goto chardel
del "Character %temp%.sav"
goto nexus
:acc
call :save
cls
echo.
echo  Account Settings
echo.
echo  1. Remember Login %rem%
echo  2. Change Password
echo  3. Delete Account
echo  Q. Back
choice /c:123q /n
if errorlevel 4 goto opt
if errorlevel 3 goto delacc
if errorlevel 2 goto passacc
if %rem%==[ON] (
set rem=[OFF]
) else (
set rem=[ON]
)
cd ..
cd ..
(
echo %rem%
echo %user%
)>"RotBG Exalt.data"
cd users
cd "%user%"
goto acc
:passacc
:delacc
cls
echo.
echo  Delete Account
echo.
echo Are you sure? [Y/N]
choice /n
if errorlevel 2 goto acc
cd ..
rd /s /q "%user%"
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
goto reset





::functions

:levelup
if %xpmax% geq 1850 (
set xpmax=2000
set xp=0
set /a bfame+=1
)
if %xpmax% lss 1850 (
set /a lvl+=1
set /a bfame+=1
set xp=0
set /a xpmax+=100
echo Level Up!
)

:save
(
echo %user%
echo %pass%
echo %stars%
echo %char%
echo %cc%
echo %fame%
echo %newcharcost%
)>"%user%.sav"
(
echo %class% %lvl%
echo %class%
echo %lvl%
echo %bfame%
echo %bfameq%
echo %xp%
echo %xpmax%
echo %hp%
echo %mp%
echo %att%
echo %def%
echo %spd%
echo %vit%
echo %wis%
)>"%char%.sav"
goto :eof

:load
(
set /p user=
set /p pass=
set /p stars=
set /p char=
set /p cc=
set /p fame=
set /p newcharcost=
)<"%user%.sav"
set temp=0
:loadchar
set /a temp+=1
if not exist "Character %temp%.sav" goto endloadchar
(
set /p %char%=
)<"Character %temp%.sav"
goto loadchar
:endloadchar
(
set /p %char%=
set /p class=
set /p lvl=
set /p bfame=
set /p bfameq=
set /p xp=
set /p xpmax=
set /p hp=
set /p mp=
set /p att=
set /p def=
set /p spd=
set /p vit=
set /p wis=
)<"%char%.sav"
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