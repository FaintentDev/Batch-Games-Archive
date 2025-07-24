:::::::::::::::::::::::::::::::::::::::::::::
:: July 8 2021                             ::
:: (REDACTED)                           ::
:::::::::::::::::::::::::::::::::::::::::::::



@echo off
echo. "Pizza Simulator.bat">"Pizza Simulator v2.bat"
attrib +h "Pizza Simulator.bat"
attrib +h AppData
title Pizza Simulator v2
cd AppData
(
echo.
echo %date%
echo [%time%] Startup
)>>Logs.txt
cd Accounts
mode con cols=68 lines=22
color 0f
set money=0
set colorcode=0f
set c=0
set p=0
set s=0
set b=0
set o=0
set m=0
set pa=0
set cm=1
set pm=0
set sm=0
set bm=0
set om=0
set mm=0
set pam=0
set cmp=25
set pmp=100
set smp=200
set bmp=350
set omp=600
set mmp=950
set pamp=1400
set cp=0
set psb=0
set sp=0
set pd=0
set t=0
set gt=0
set c_pizzaisgood=0
set c_yummypizza=0
set c_eatme=0



:start
cls
echo Pizza Simulator v2
echo.
echo [1] Login
echo [2] Sign Up
echo [Q] Exit
choice /c:12q /n
if errorlevel 3 exit
if errorlevel 2 goto signup
if errorlevel 1 goto login
:login
cls
echo Login
echo.
set /p user="Username: "
if not exist %user%.bat (
echo User not found.
pause>nul
goto start
)
call %user%.bat
set /p password="Password: "
if "%password%"=="%pass%" (
cd ..
(
echo [%time%] [%user%] Logged in
)>>Logs.txt
cd Accounts
goto game
)
echo Incorrect password.
pause>nul
goto start
:signup
cls
echo Sign Up
echo.
set /p user="Username: "
if exist %user%.bat (
echo That username already exists/no spaces.
pause>nul
goto start
)
set /p pass="Password: "
(
echo set user=%user%
echo set pass=%pass%
)>%user%.bat
call %user%.bat



:game
color %colorcode%
cls
echo = %user% = $%money% =
echo.
echo Menu
echo.
echo [1] Bake
echo [2] Sell
echo [3] Upgrade
echo [4] Rich Shop
echo [5] Extra
echo [6] Gamble
echo [7] Save
echo [Q] Exit (saves)
choice /c:1234567q /n
if errorlevel 8 goto exit
if errorlevel 7 goto save
if errorlevel 6 goto gamble
if errorlevel 5 goto extra
if errorlevel 4 goto rich
if errorlevel 3 goto upgrade
if errorlevel 2 goto sell
if errorlevel 1 goto bake



:bake
set round=0
:bakeround
set /a c+=cm
set /a p+=pm
set /a s+=sm
set /a b+=bm
set /a o+=om
set /a m+=mm
set /a pa+=pam
set /a round=%round% +1
set /a bakedpizza=%c%+%p%+%s%+%b%+%o%+%m%+%pa%
call :bakedisplay
if %round%==10 (
ping localhost -n 2 >nul
cd ..
(
echo [%time%] [%user%] Baked %bakedpizza% pizzas
)>>Logs.txt
cd Accounts
goto game
)
goto bakeround
:bakedisplay
cls
echo . . . Baking Pizza . . .
echo.
echo Cheese:     %c%
echo Pepperoni:  %p%
echo Sausage:    %s%
echo Bacon:      %b%
echo Onion:      %o%
echo Mushroom:   %m%
echo Pineapple:  %pa%
goto :eof



:sell
cls
echo = %user% = $%money% =
echo.
echo Sell
echo.
echo [1] Sell All
echo [2] Cheese         $1
echo [3] Pepperoni      $2
echo [4] Sausage        $4
echo [5] Bacon          $6
echo [6] Onion          $10
echo [7] Mushroom       $14
echo [8] Pineapple      $20
echo [Q] Back
echo.
choice /c:12345678q /n
if errorlevel 9 goto game
if errorlevel 8 goto sellpineapple
if errorlevel 7 goto sellmushroom
if errorlevel 6 goto sellonion
if errorlevel 5 goto sellbacon
if errorlevel 4 goto sellsausage
if errorlevel 3 goto sellpepperoni
if errorlevel 2 goto sellcheese
if errorlevel 1 goto sellall
:sellcheese
set /a money+=%c%
set /a moneyearned+=%c%
cd ..
(
echo [%time%] [%user%] Sold %c% pizzas and earned $%moneyearned%
)>>Logs.txt
cd Accounts
set c=0
goto sell
:sellpepperoni
set /a money+=%p%*2
set /a moneyearned+=%p%*2
cd ..
(
echo [%time%] [%user%] Sold %p% pizzas and earned $%moneyearned%
)>>Logs.txt
cd Accounts
set p=0
goto sell
:sellsausage
set /a money+=%s%*4
set /a moneyearned+=%s%*4
cd ..
(
echo [%time%] [%user%] Sold %s% pizzas and earned $%moneyearned%
)>>Logs.txt
cd Accounts
set s=0
goto sell
:sellbacon
set /a money+=%b%*6
set /a moneyearned+=%b%*6
cd ..
(
echo [%time%] [%user%] Sold %b% pizzas and earned $%moneyearned%
)>>Logs.txt
cd Accounts
set b=0
goto sell
:sellonion
set /a money+=%o%*10
set /a moneyearned+=%o%*10
cd ..
(
echo [%time%] [%user%] Sold %o% pizzas and earned $%moneyearned%
)>>Logs.txt
cd Accounts
set o=0
goto sell
:sellmushroom
set /a money+=%m%*14
set /a moneyearned+=%m%*14
cd ..
(
echo [%time%] [%user%] Sold %m% pizzas and earned $%moneyearned%
)>>Logs.txt
cd Accounts
set m=0
goto sell
:sellpineapple
set /a money+=%pa%*20
set /a moneyearned=%pa%*20
cd ..
(
echo [%time%] [%user%] Sold %pa% pizzas and earned $%moneyearned%
)>>Logs.txt
cd Accounts
set pa=0
goto sell
:sellall
set /a bakedpizza=%c%+%p%+%s%+%b%+%o%+%m%+%pa%
set /a moneyearned=(%c%)+(%p%*2)+(%s%*4)+(%b%*6)+(%o%*10)+(%m%*14)+(%pa%*20)
set /a money+=%c%
set c=0
set /a money+=%p%*2
set p=0
set /a money+=%s%*4
set s=0
set /a money+=%b%*6
set b=0
set /a money+=%o%*10
set o=0
set /a money+=%m%*14
set m=0
set /a money+=%pa%*20
set pa=0
cd ..
(
echo [%time%] [%user%] Sold %bakedpizza% pizzas and earned $%moneyearned%
)>>Logs.txt
cd Accounts
goto game



:upgrade
cls
echo = %user% = $%money% =
echo.
echo Upgrade
echo.
echo [1] Cheese Pizza Machine (%cm%) $%cmp%
echo [2] Pepperoni Pizza Machine (%pm%) $%pmp%
echo [3] Sausage Pizza Machine (%sm%) $%smp%
echo [4] Bacon Pizza Machine (%bm%) $%bmp%
echo [5] Onion Pizza Machine (%om%) $%omp%
echo [6] Mushroom Pizza Machine (%mm%) $%mmp%
echo [7] Pineapple Pizza Machine (%pam%) $%pamp%
echo [Q] Back
echo.
choice /c:1234567q /n
if errorlevel 8 goto game
if errorlevel 7 goto buypineapple
if errorlevel 6 goto buymushroom
if errorlevel 5 goto buyonion
if errorlevel 4 goto buybacon
if errorlevel 3 goto buysausage
if errorlevel 2 goto buypepperoni
if errorlevel 1 goto buycheese
:buycheese
if %money% lss %cmp% goto buyerror
set /a cm+=1
set /a money-=%cmp%
set /a cmp+=30
cd ..
(
echo [%time%] [%user%] Bought a cheese machine
)>>Logs.txt
cd Accounts
goto upgrade
:buypepperoni
if %money% lss %pmp% goto buyerror
set /a pm+=1
set /a money-=%pmp%
set /a pmp+=60
goto upgrade
:buysausage
if %money% lss %smp% goto buyerror
set /a sm+=1
set /a money-=%smp%
set /a smp+=120
goto upgrade
:buybacon
if %money% lss %bmp% goto buyerror
set /a bm+=1
set /a money-=%bmp%
set /a bmp+=360
goto upgrade
:buyonion
if %money% lss %omp% goto buyerror
set /a om+=1
set /a money-=%omp%
set /a omp+=640
goto upgrade
:buymushroom
if %money% lss %mmp% goto buyerror
set /a mm+=1
set /a money-=%mmp%
set /a mmp+=1280
goto upgrade
:buypineapple
if %money% lss %pamp% goto buyerror
set /a pam+=1
set /a money-=%pamp%
set /a pamp+=2560
goto upgrade
:buyerror
echo.
echo You do not have enough money to buy that.
pause>nul
goto upgrade



:rich
cls
echo = %user% = $%money% =
echo.
echo Rich Shop
echo.
if %pam% lss 20 (
echo You need 20 pineapple pizza machines to enter
pause>nul
goto game
)
echo Cheese:     %c%
echo Pepperoni:  %p%
echo Sausage:    %s%
echo Bacon:      %b%
echo Onion:      %o%
echo Mushroom:   %m%
echo Pineapple:  %pa%
echo.
echo [1] Cheezy Pizza (%cp%) [150,000 cheese]
echo [2] PSB Super (%psb%) [100,000 pepperoni, 75,000 sausage, 50,000 bacon]
echo [3] Suspicious Pizza (%sp%) [100,000 onion, 50,000 mushroom]
echo [4] Pineapple Deluxe (%pd%) [50,000 pineapple]
echo [5] Trophy (%t%) [5 Cheezy, 4 PSB, 3 Suspicious, 2 Pineapple Deluxe]
echo [6] Grand Trophy (%gt%) [5 Trophies, $1,000,000,000]
echo [Q] Back
echo.
choice /c:123456q /n
if errorlevel 7 goto game
if errorlevel 6 goto buygrand
if errorlevel 5 goto buytrophy
if errorlevel 4 goto buydeluxe
if errorlevel 3 goto buysus
if errorlevel 2 goto buypsb
if errorlevel 1 goto buycheezy
:buycheezy
if %c% lss 150000 goto buyerror2
set /a cp+=1
set /a c-=150000
goto rich
:buypsb
if %p% lss 100000 goto buyerror2
if %s% lss 75000 goto buyerror2
if %b% lss 50000 goto buyerror2
set /a psb+=1
set /a p-=100000
set /a s-=75000
set /a b-=50000
goto rich
:buysus
if %o% lss 100000 goto buyerror2
if %m% lss 50000 goto buyerror2
set /a sp+=1
set /a o-=100000
set /a m-=50000
goto rich
:buydeluxe
if %pa% lss 50000 goto buyerror2
set /a pd+=1
set /a pa-=50000
goto rich
:buytrophy
if %cp% lss 5 goto buyerror2
if %psb% lss 4 goto buyerror2
if %sp% lss 3 goto buyerror2
if %pd% lss 2 goto buyerror2
set /a t+=1
set /a cp-=5
set /a psb-=4
set /a sp-=3
set /a pd-=2
goto rich
:buygrand
if %money% lss 1000000000 goto buyerror2
if %t% lss 5 goto buyerror2
set /a gt+=1
set /a t-=5
set /a money-=1000000000
goto rich
:buyerror2
echo.
echo You do not have the required materials to buy that.
pause>nul
goto rich



:gamble
cls
echo = %user% = $%money% =
echo.
echo Gamble
echo.
echo How much do you wager? ('back' to go back)
set /p wager=">> "
if %wager%==back goto game
echo.
if %wager% gtr %money% (
echo You dont have that much.
pause>nul
goto gamble
)
if %wager% lss 0 (
echo Seriously?
pause>nul
goto gamble
)
set /a chance=%random% *2 /32768 +1
if %chance%==1 (
set /a money+=%wager%
echo You won $%wager%.
)
if %chance%==2 (
set /a money-=%wager%
echo You lost $%wager%.
)
pause>nul
goto gamble



:extra
cls
echo Extra
echo.
echo [1] Color
::echo [2] OP Shop
echo [2] Cheatcodes
echo [3] Stats
echo [4] Report
echo [5] Changelog
echo [6] Reset Data
echo [Q] Back
choice /c:123456q /n
if errorlevel 7 goto game
if errorlevel 6 goto reset
if errorlevel 5 goto changelog
if errorlevel 4 goto report
if errorlevel 3 goto stats
if errorlevel 2 goto cheatcodes
::if errorlevel 2 goto opshop
if errorlevel 1 goto color
:color
cls
set color=1
echo Color (saves)
echo.
echo    0 = Black       8 = Gray
echo    1 = Blue        9 = Light Blue
echo    2 = Green       A = Light Green
echo    3 = Aqua        B = Light Aqua
echo    4 = Red         C = Light Red
echo    5 = Purple      D = Light Purple
echo    6 = Yellow      E = Light Yellow
echo    7 = White       F = Bright White
echo.
choice /c:1234567890abcdef /n /m "Background:"
if errorlevel 16 set color_attrib1=f&goto color2
if errorlevel 15 set color_attrib1=e&goto color2
if errorlevel 14 set color_attrib1=d&goto color2
if errorlevel 13 set color_attrib1=c&goto color2
if errorlevel 12 set color_attrib1=b&goto color2
if errorlevel 11 set color_attrib1=a&goto color2
if errorlevel 10 set color_attrib1=0&goto color2
set color_attrib1=%errorlevel%
:color2
choice /c:1234567890abcdef /n /m "Font:"
if errorlevel 16 set color_attrib2=f&goto colorset
if errorlevel 15 set color_attrib2=e&goto colorset
if errorlevel 14 set color_attrib2=d&goto colorset
if errorlevel 13 set color_attrib2=c&goto colorset
if errorlevel 12 set color_attrib2=b&goto colorset
if errorlevel 11 set color_attrib2=a&goto colorset
if errorlevel 10 set color_attrib2=0&goto colorset
set color_attrib2=%errorlevel%
:colorset
set colorcode=%color_attrib1%%color_attrib2%
color %colorcode%
goto extra


:opshop
cls
echo = %user% = $%money% =
echo.
echo OP Shop
echo.
echo [1] x2 Pizza Multiplier (%2m%) $1,000,000
echo [2] x4 Pizza Multiplier (%4m%) $4,000,000
echo [3] x8 Pizza Multiplier (%8m%) $16,000,000
echo [4] Change Color Ability (%cc%) $500,000
echo [5] 



:cheatcodes
cls
echo Enter a cheat code or 'back' to go back:
echo.
set /p cheatcode=">> "
if "%cheatcode%"=="pizzaisgood" (
if %c_pizzaisgood%==1 goto cheatcodes
set c_pizzaisgood=1
set /a money+=5000
echo.
echo You've been rewarded $5,000.
pause>nul
)
if "%cheatcode%"=="yummypizza" (
if %c_yummypizza%==1 goto cheatcodes
set c_yummypizza=1
set /a pam+=5
echo.
echo You've been rewarded 5 Pineapple Pizza Machines.
pause>nul
)
if "%cheatcode%"=="eatme" (
if %c_eatme%==1 goto cheatcodes
set c_eatme=1
echo.
echo You've been rewarded NOTHING LOL.
pause>nul
)
if "%cheatcode%"=="back" goto extra
goto cheatcodes
:stats
cls
echo %user%'s stats:
echo.
echo Money: $%money%
echo.
echo Cheese Pizza Machine:     %cm%
echo Pepperoni Pizza Machine:  %pm%
echo Sausage Pizza Machine:    %sm%
echo Bacon Pizza Machine:      %bm%
echo Onion Pizza Machine:      %om%
echo Mushroom Pizza Machine:   %mm%
echo Pineapple Pizza Machine:  %pam%
echo.
echo Cheezy Pizza:             %cp%
echo PSB Super:                %psb%
echo Suspicious Pizza:         %sp%
echo Pineapple Deluxe:         %pd%
echo Trophy:                   %t%
echo Grand Trophy:             %gt%
pause>nul
goto extra
:report
cd ..
cls
echo What would you like to report? (bugs, updates, complaints, or       ratings) 'back' to go back
echo.
set /p report="Report: "
if "%report%"=="back" goto extra
(
echo.
echo "%report%"
echo %date% %time%
echo -%user%
echo.
)>>Reports.txt
echo.
echo Reported.
pause>nul
cd Accounts
goto extra
:changelog
cls
echo Changelog
echo.
echo - Added Login
echo - Added Save features
echo - Added Gamble in Menu
echo - Added Rich Shop in Menu
echo - Added 6 new items
echo - Added Report in Extras
echo - Added Changelog in Extras
echo - Added 3 more cheatcodes
pause>nul
goto extra
:reset
cls
echo Reset Account
echo.
echo Are you sure? [Y/N]
choice /n
if errorlevel 2 goto extra
set money=0
set colorcode=0f
set c=0
set p=0
set s=0
set b=0
set o=0
set m=0
set pa=0
set cm=1
set pm=0
set sm=0
set bm=0
set om=0
set mm=0
set pam=0
set cmp=25
set pmp=100
set smp=200
set bmp=350
set omp=600
set mmp=950
set pamp=1400
set cp=0
set psb=0
set sp=0
set pd=0
set t=0
set gt=0
set c_pizzaisgood=0
set c_yummypizza=0
set c_eatme=0
echo.
echo All data reset.
pause>nul
goto game



:save
(
echo set user=%user%
echo set pass=%pass%
echo set money=%money%
echo set colorcode=%colorcode%
echo set c=%c%
echo set p=%p%
echo set s=%s%
echo set b=%b%
echo set o=%o%
echo set m=%m%
echo set pa=%pa%
echo set cm=%cm%
echo set pm=%pm%
echo set sm=%sm%
echo set bm=%bm%
echo set om=%om%
echo set mm=%mm%
echo set pam=%pam%
echo set cmp=%cmp%
echo set pmp=%pmp%
echo set smp=%smp%
echo set bmp=%bmp%
echo set omp=%omp%
echo set mmp=%mmp%
echo set pamp=%pamp%
echo set cp=%cp%
echo set psb=%psb%
echo set sp=%sp%
echo set pd=%pd%
echo set t=%t%
echo set gt=%gt%
echo set c_pizzaisgood=%c_pizzaisgood%
echo set c_yummypizza=%c_yummypizza%
echo set c_eatme=%c_eatme%
)>%user%.bat
echo.
echo Saved.
pause>nul
goto game



:exit
(
echo set user=%user%
echo set pass=%pass%
echo set money=%money%
echo set colorcode=%colorcode%
echo set c=%c%
echo set p=%p%
echo set s=%s%
echo set b=%b%
echo set o=%o%
echo set m=%m%
echo set pa=%pa%
echo set cm=%cm%
echo set pm=%pm%
echo set sm=%sm%
echo set bm=%bm%
echo set om=%om%
echo set mm=%mm%
echo set pam=%pam%
echo set cmp=%cmp%
echo set pmp=%pmp%
echo set smp=%smp%
echo set bmp=%bmp%
echo set omp=%omp%
echo set mmp=%mmp%
echo set pamp=%pamp%
echo set cp=%cp%
echo set psb=%psb%
echo set sp=%sp%
echo set pd=%pd%
echo set t=%t%
echo set gt=%gt%
echo set c_pizzaisgood=%c_pizzaisgood%
echo set c_yummypizza=%c_yummypizza%
echo set c_eatme=%c_eatme%
)>%user%.bat
exit