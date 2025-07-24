
<!-- : Begin batch script

:::::::::::::::::::::::::::::::::::::::::::::
:: Created April 21, 2022 by (REDACTED) ::
:::::::::::::::::::::::::::::::::::::::::::::

@echo off
cd data
title Batch Pokemon
:reset
set title=
set c=0
set ra=0
set ba=0
set ya=0
set rac=0
set bac=0
set yac=0
set pb=0
set gb=0
set ub=0
set pt=0
set spt=0
set fpt=0
set color=0f
set daily=0
set check=0
set p1=0
set p2=0
set p3=0
set p4=0
set p2hp=0
set p2mhp=0
set p3hp=0
set p3mhp=0
set p4hp=0
set p4mhp=0



:start
start /b cscript //nologo "%~f0?.wsf" //job:sound "boot.mp3"
mode con cols=136 lines=20
call save.bat
cls
echo.
echo  ^&^&^&^&^&^&^&\             ^&^&\               ^&^&\             ^&^&^&^&^&^&^&\            ^&^&\                                                   
echo  ^&^&  __^&^&\            ^&^& !              ^&^& !            ^&^&  __^&^&\           ^&^& !                                                  
echo  ^&^& !  ^&^& ! ^&^&^&^&^&^&\ ^&^&^&^&^&^&\    ^&^&^&^&^&^&^&\ ^&^&^&^&^&^&^&\        ^&^& !  ^&^& ! ^&^&^&^&^&^&\  ^&^& !  ^&^&\  ^&^&^&^&^&^&\  ^&^&^&^&^&^&\^&^&^&^&\   ^&^&^&^&^&^&\  ^&^&^&^&^&^&^&\  
echo  ^&^&^&^&^&^&^&\ ! \____^&^&\\_^&^&  _!  ^&^&  _____!^&^&  __^&^&\       ^&^&^&^&^&^&^&  !^&^&  __^&^&\ ^&^& ! ^&^&  !^&^&  __^&^&\ ^&^&  _^&^&  _^&^&\ ^&^&  __^&^&\ ^&^&  __^&^&\ 
echo  ^&^&  __^&^&\  ^&^&^&^&^&^&^& ! ^&^& !    ^&^& /      ^&^& !  ^&^& !      ^&^&  ____/ ^&^& /  ^&^& !^&^&^&^&^&^&  / ^&^&^&^&^&^&^&^& !^&^& / ^&^& / ^&^& !^&^& /  ^&^& !^&^& !  ^&^& !
echo  ^&^& !  ^&^& !^&^&  __^&^& ! ^&^& !^&^&\ ^&^& !      ^&^& !  ^&^& !      ^&^& !      ^&^& !  ^&^& !^&^&  _^&^&\  ^&^&   ____!^&^& ! ^&^& ! ^&^& !^&^& !  ^&^& !^&^& !  ^&^& !
echo  ^&^&^&^&^&^&^&  !\^&^&^&^&^&^&^& ! \^&^&^&^&  !\^&^&^&^&^&^&^&\ ^&^& !  ^&^& !      ^&^& !      \^&^&^&^&^&^&  !^&^& ! \^&^&\ \^&^&^&^&^&^&^&\ ^&^& ! ^&^& ! ^&^& !\^&^&^&^&^&^&  !^&^& !  ^&^& !
echo  \_______/  \_______!  \____/  \_______!\__!  \__!      \__!       \______/ \__!  \__! \_______!\__! \__! \__! \______/ \__!  \__! v1.1
echo.
echo.
echo.
echo [ Press any key to begin... ]
pause>nul
mode con cols=70 lines=30
start /b cscript //nologo "%~f0?.wsf" //job:sound "select.mp3"
start /b cscript //nologo "%~f0?.wsf" //job:music "main.mp3"
if %p1%==0 goto newtrainer
goto menu
:newtrainer
set p1l=12
set p1hp=18
set p1mhp=18
set p1a=3
set p1d=3
set p1s=3
cls
echo.
set /p user="What should your name be, new trainer? "
echo.
echo Choose your starter Pokemon:
echo.
echo  1. Bulbasaur
echo  2. Charmander
echo  3. Squirtle
choice /c:123 /n
if errorlevel 3 (
set p1=Squirtle
set p1t=Water
goto menu
)
if errorlevel 2 (
set p1=Charmander
set p1t=Fire
goto menu
)
set p1=Bulbasaur
set p1t=Grass
goto menu



:daily
set check=0
set /a rac=%random% * 9 / 32768 + 4
set /a bac=%random% * 5 / 32768 + 2
set /a yac=%random% * 3 / 32768 + 1
cls
echo.
echo Daily Login Reward!
echo.
echo  + 100 PokeCoins
pause>nul
set /a c+=100
set daily=%date%



:menu
if not "%daily%"=="%date%" goto daily
call :save
cls
echo.
echo  .: Menu :.
echo.
echo  ~ %user%%title% ~
echo.
echo  PokeCoins: %c%
echo.
echo  1. Expedition
echo  2. Cram-o-matic
echo  3. Market
echo  4. Pokemon Center
echo  5. View Pokemon
echo  6. Settings
choice /c:123456 /n
if errorlevel 6 goto set
if errorlevel 5 goto pokemon
if errorlevel 4 goto pokecenter
if errorlevel 3 goto market
if errorlevel 2 goto cram



start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:music "game.mp3"
start /b cscript //nologo "%~f0?.wsf" //job:music "rain.mp3"
:expedition
call :save
cls
echo.
echo Traveling .
ping localhost -n 2 >nul
cls
echo.
echo Traveling ..
ping localhost -n 2 >nul
cls
echo.
echo Traveling ...
ping localhost -n 2 >nul
set /a r=%random% * 2 / 32768 + 1
if %r%==1 goto encounter
if %r%==2 goto event
:encounter
::HP 6-36
set /a ehp=%random% * 31 / 32768 + 6
set /a eh=%ehp% / 6
set /a ea=%random% * 6 / 32768 + 1
set /a ed=%random% * 6 / 32768 + 1
set /a es=%random% * 6 / 32768 + 1
set /a el=%eh%+%ea%+%ed%+%es%
set /a r=%random% * 3 / 32768 + 1
if %r%==1 (
set e=Bulbasaur
set et=Grass
)
if %r%==2 (
set e=Charmander
set et=Fire
)
if %r%==3 (
set e=Squirtle
set et=Water
)
cls
echo.
echo You've encountered a wild %e% [Lv.%el%] {Type: %et%}
pause>nul
:chooseact
cls
echo.
echo Choose a Pokemon to send out:
echo.
call :pokes
echo.
set /p ch=">> "
if not %ch%==1 if not %ch%==2 if not %ch%==3 if not %ch%==4 goto chooseact
if %ch%==2 if %p2%==0 goto chooseact
if %ch%==3 if %p3%==0 goto chooseact
if %ch%==4 if %p4%==0 goto chooseact
:battle
call :save
if %ch%==1 set act=%p1% [Lv.%p1l%] {Type: %p1t%}&set acthp=HP: %p1hp%/%p1mhp%
if %ch%==2 set act=%p2% [Lv.%p2l%] {Type: %p2t%}&set acthp=HP: %p2hp%/%p2mhp%
if %ch%==3 set act=%p3% [Lv.%p3l%] {Type: %p3t%}&set acthp=HP: %p3hp%/%p3mhp%
if %ch%==4 set act=%p4% [Lv.%p4l%] {Type: %p4t%}&set acthp=HP: %p4hp%/%p4mhp%
cls
echo.
echo =====================================
echo.
echo  %e% [Lv.%el%] {Type: %et%}
echo.
echo  HP: %ehp%
echo.
echo =====================================
echo.
echo  %act%
echo.
echo  %acthp%
echo.
echo  Z. Attack
echo  X. Item
echo  C. Switch
echo  Q. Flee
choice /c:zxcq /n
if errorlevel 4 (
cls
echo.
echo %user% escaped!
pause>nul
goto expedition
)
if errorlevel 3 goto switch
if errorlevel 2 goto item
:turn
cls
if %dmg% gtr 0 (
echo.
echo You do %dmg% damage!
pause>nul
)
echo.
echo %e% does %edmg% damage!
pause>nul
set dmg=0
goto battle
:item
cls
echo.
echo  .: Items :.
echo.
echo  1. Poke Ball (%pb%)
echo  2. Great Ball (%gb%)
echo  3. Ultra Ball (%ub%)
echo  4. Potion (%pt%)
echo  5. Super Potion (%spt%)
echo  6. Full Potion (%fpt%)
echo  Q. Back
choice /c:123456q /n
if errorlevel 7 goto battle
:switch
cls
echo.
echo  .: Switch :.
echo.
call :pokes
echo  Q. Back
echo.
set /p tmpch=">> "
if %tmpch%==q goto battle
set /a ch=%tmpch%
if not %ch%==1 if not %ch%==2 if not %ch%==3 if not %ch%==4 goto switch
if %ch%==2 if %p2%==0 goto switch
if %ch%==3 if %p3%==0 goto switch
if %ch%==4 if %p4%==0 goto switch
goto turn


:event
set /a r=%random% * 100 / 32768 + 1
::80% chance - random loot
if %r% leq 80 goto loot
::12% chance - random minigame
if %r% geq 81 if %r% leq 92 goto minigame
::8% chance - traveling merchant
if %r% geq 93 goto merchant
:loot
cls
echo.
set /a r=%random% * 100 / 32768 + 1
set /a r1=%random% * 3 / 32768 + 1
set /a r2=%random% * 3 / 32768 + 1
if %r2%==1 set r1a=Red&set r1b=ra
if %r2%==2 set r1a=Blue&set r1b=ba
if %r2%==3 set r1a=Yellow&set r1b=ya
set /a r3=%random% * 21 / 32768 + 5
if %r2%==1 set r1c=Poke&set r1d=pb
if %r2%==2 set r1c=Great&set r1d=gb
if %r2%==3 set r1c=Ultra&set r1d=ub
::60% chance - apricorn
if %r% leq 60 (
set /a %r1b%+=%r1%
echo You found %r1% %r1a% Apricorn!
echo.
call :continue
)
::35% chance - coins
if %r% geq 61 if %r% leq 95 (
set /a c+=%r3%
echo You found %r3% PokeCoins!
echo.
call :continue
)
::5% chance - pokeball
if %r% geq 96 (
set /a %r1d%+=1
echo You found an abandoned %r1c% Ball!
echo.
call :continue
)
:minigame
cls
echo.
echo You approach an Arcade...
pause>nul
echo.
echo Go inside? [Y/N]
choice /n
if errorlevel 2 (
echo.
call :continue
)
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:music "arcade.mp3"
cls
echo.
echo You walk up to one of the Arcade machines...
:guessnum
set /a guesses=10
set /a answer=%random% * 1000 / 32768 + 1
set /a r=%random% * 36 / 32768 + 15
cls
echo.
echo Try to guess my number!
echo.
echo If you win, I'll give you %r% PokeCoins!
echo.
echo Enter 'stop' at anytime to give up.
:guess
if %guesses%==0 goto glose
echo.
echo.
echo You have %guesses% guesses remaining.
echo.
set /p guess=
if %guess%==stop goto glose
if %guess% gtr %answer% echo Lower.
if %guess% lss %answer% echo Higher.
if %guess%==%answer% goto win
set /a guesses=%guesses% -1
goto guess
:glose
cls
echo YOU LOSE
echo.
echo The number was %answer%.
echo.
echo Better luck next time.
echo.
call :continue
:win
set /a c+=%r%
cls
echo Correct!
echo.
echo The number was %answer%.
echo.
echo Here's your reward.
echo.
echo  + %r% PokeCoins
echo.
call :continue
:merchant
set /a r=%random% * 151 / 32768 + 50
cls
echo.
echo You found a Traveling Merchant!
echo.
echo He offers you a 'Title: The Best' for %r% PokeCoins
echo.
echo You have: %c% PokeCoins
echo.
echo Accept offer? [Y/N]
choice /n
if errorlevel 2 goto skipoffer
if errorlevel 1 (
if %c% lss %r% (
echo.
echo You don't have enough PokeCoins.
goto skipoffer
)
set /a c-=%r%
set title= [The Best]
cls
echo.
echo You purchased 'Title: The Best'
)
:skipoffer
echo.
call :continue



:cram
call :save
cls
echo.
echo  .: Cram-O-Matic :.
echo.
echo  ================
echo  Poke Balls: %pb%
echo  Great Balls: %gb%
echo  Ultra Balls: %ub%
echo  ================
echo.
echo  (4 Apricorn = 1 Ball)
echo.
echo  1. Red Apricorn (%ra%)
echo  2. Blue Apricorn (%ba%)
echo  3. Yellow Apricorn (%ya%)
echo  Q. Back
choice /c:123q /n

if errorlevel 4 goto menu
if errorlevel 3 (
if %ya% lss 4 goto cram
call :cramming
set /a ya-=4
set /a ub+=1
goto cram
)
if errorlevel 2 (
if %ba% lss 4 goto cram
call :cramming
set /a ba-=4
set /a gb+=1
goto cram
)
if %ra% lss 4 goto cram
call :cramming
set /a ra-=4
set /a pb+=1
goto cram



:market
call :save
cls
echo.
echo  .: Market (Refresh Daily) :.
echo.
echo  PokeCoins: %c%
echo.
echo  1. Red Apricorn - %rac% Left (5 PokeCoins)
echo  2. Blue Apricorn - %bac% Left (10 PokeCoins)
echo  3. Yellow Apricorn - %yac% Left (20 PokeCoins)
echo  Q. Back
choice /c:123q /n

if errorlevel 4 goto menu
if errorlevel 3 (
if %yac%==0 goto market
if %c% lss 10 goto market
set /a c-=10
set /a yac-=1
set /a ya+=1
goto market
)
if errorlevel 2 (
if %bac%==0 goto market
if %c% lss 10 goto market
set /a c-=10
set /a bac-=1
set /a ba+=1
goto market
)
if %rac%==0 goto market
if %c% lss 5 goto market
set /a c-=5
set /a rac-=1
set /a ra+=1
goto market



:pokecenter
cls
echo.
echo  .: PokeCenter :.
echo.
echo  1. Heal Pokemon
echo  2. Chat
echo  Q. Back
choice /c:12q /n
if errorlevel 3 goto menu
if errorlevel 2 goto chat
if not %p1hp%==%p1mhp% (
call :healing
set /a p1hp=%p1mhp%
)
if not %p2hp%==%p2mhp% (
call :healing
set /a p2hp=%p2mhp%
)
if not %p3hp%==%p3mhp% (
call :healing
set /a p3hp=%p3mhp%
)
if not %p4hp%==%p4mhp% (
call :healing
set /a p4hp=%p4mhp%
)
goto pokecenter
:chat
cls
echo.
echo Nurse Joy: "Hello, %user%! How may I assist?"
echo.
echo  1. Small talk
echo  2. Gift
echo  3. Type response
echo  Q. Leave
choice /c:123q /n
if errorlevel 4 (
cls
echo.
echo %user%: "Nevermind. Goodbye!"
pause>nul
echo.
echo Nurse Joy: "Ok, bye!"
pause>nul
goto pokecenter
)
if errorlevel 3 goto typ
if errorlevel 2 goto gift
cls
echo.
echo 
:gift
cls
echo.
echo You have: %c% PokeCoins
echo.
set /p ch="How many PokeCoins do you wish to give? "
if %ch% leq 0 goto chat
if %ch% gtr %c% goto chat
set /a c-=%ch%
echo.
echo Nurse Joy greatly appriciates your gift!
pause>nul
::1c = 2% chance
set /a r=%random% * 50 / 32768 + 1
::25c = 16.6% chance
if %ch% geq 25 set /a r=%random% * 6 / 32768 + 1
::50c = 25% chance
if %ch% geq 50 set /a r=%random% * 4 / 32768 + 1
::75c = 33.3% chance
if %ch% geq 75 set /a r=%random% * 3 / 32768 + 1
::100c = 50% chance
if %ch% geq 100 set /a r=%random% * 2 / 32768 + 1
set /a rn=%random% * 3 / 32768 + 1
if %r%==1 (
echo.
echo Nurse Joy gives you %rn% Ultra Balls in return!
pause>nul
)
goto chat
:typ
cls
echo.
echo Nurse Joy: "Hello, %user%! How may I assist?"
echo.
set /p ch="%user%: "
echo.
if "%ch%"=="hi" (
echo Nurse Joy: "Hi!"
pause>nul
goto chat
)
if "%ch%"=="hello" (
echo Nurse Joy: "Hello there!"
pause>nul
goto chat
)
if "%ch%"=="good morning" (
echo Nurse Joy: "Morning, %user%!"
if %check%==0 (
set check=1
set /a c+=25
echo.
echo  + 25 PokeCoins
)
pause>nul
goto chat
)
echo Nurse Joy: "What?"
pause>nul
goto chat



:pokemon
cls
echo.
echo  .: %user%'s Pokemon :.
echo.
call :pokes
pause>nul
goto menu



:set
cls
echo.
echo  .: Settings :.
echo.
echo  1. Color
echo  2. Change Name
echo  3. Reset Data
echo  4. Changelog
echo  5. Credits
echo  Q. Back
choice /c:12345q /n
if errorlevel 6 goto menu
if errorlevel 5 (
cls
echo.
echo  .: Credits :.
echo.
echo Code ... (REDACTED)
echo Design ... (REDACTED)
echo Inspiration ... Nintendo / The Pokemon Company
echo Music ... Nintendo / Various Artists
pause>nul
goto set
)
if errorlevel 4 (
cls
echo.
echo  .: Changelog :.
echo.
echo ===== v1.1 ===== 6/29/22
echo.
echo - Sounds now run inside of batch script
echo - New UI
echo.
echo ===== v1.0 ===== 4/21/22
echo.
echo - Initial release
pause>nul
goto set
)
if errorlevel 3 (
cls
echo.
echo  .: Reset Data :.
echo.
echo Are you sure? [Y/N]
choice /n
if errorlevel 2 goto set
del save.bat
goto reset
)
if errorlevel 2 (
cls
echo.
set /p user="What would you like to be called? "
echo.
echo Got it.
pause>nul
goto set
)
cls
echo.
echo  .: Color :.
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
set color=%c1%%c2%
color %color%
goto set



::Functions

:pokes
echo  1. %p1% [Lv.%p1l%] {Type: %p1t%} (HP: %p1hp%/%p1mhp%)
if not %p2%==0 echo  2. %p2% [Lv.%p2l%] {Type: %p2t%} (HP: %p2hp%/%p2mhp%)
if not %p3%==0 echo  3. %p3% [Lv.%p3l%] {Type: %p3t%} (HP: %p3hp%/%p3mhp%)
if not %p4%==0 echo  4. %p4% [Lv.%p4l%] {Type: %p4t%} (HP: %p4hp%/%p4mhp%)
goto :eof
:continue
echo  E. Continue
echo  Q. End
choice /c:eq /n
if errorlevel 2 (
start /b cscript //nologo "%~f0?.wsf" //job:kill
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:music "main.mp3"
goto menu
)
goto expedition
:cramming
cls
echo.
echo  Cramming...
ping localhost -n 2 >nul
goto :eof
:healing
cls
echo.
echo  Healing [+  ]
ping localhost -n 2 >nul
cls
echo.
echo  Healing [++ ]
ping localhost -n 2 >nul
cls
echo.
echo  Healing [+++]
ping localhost -n 2 >nul
goto :eof
:save
(
echo set user=%user%
echo set title=%title%
echo set c=%c%
echo set ra=%ra%
echo set ba=%ba%
echo set ya=%ya%
echo set rac=%rac%
echo set bac=%bac%
echo set yac=%yac%
echo set pb=%pb%
echo set gb=%gb%
echo set ub=%ub%
echo set pt=%pt%
echo set spt=%spt%
echo set fpt=%fpt%
echo set p1=%p1%
echo set p1t=%p1t%
echo set p1l=%p1l%
echo set p1a=%p1a%
echo set p1d=%p1d%
echo set p1s=%p1s%
echo set p1hp=%p1hp%
echo set p1mhp=%p1mhp%
echo set p2=%p2%
echo set p2t=%p2t%
echo set p2l=%p2l%
echo set p2a=%p2a%
echo set p2d=%p2d%
echo set p2s=%p2s%
echo set p2hp=%p2hp%
echo set p2mhp=%p2mhp%
echo set p3=%p3%
echo set p3t=%p3t1%
echo set p3l=%p3l%
echo set p3a=%p3a%
echo set p3d=%p3d%
echo set p3s=%p3s%
echo set p3hp=%p3hp%
echo set p3mhp=%p3mhp%
echo set p4=%p4%
echo set p4t=%p4t%
echo set p4l=%p4l%
echo set p4a=%p4a%
echo set p4d=%p4d%
echo set p4s=%p4s%
echo set p4hp=%p4hp%
echo set p4mhp=%p4mhp%
echo set daily=%daily%
echo set check=%check%
echo set color=%color%
echo color %color%
)>save.bat
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