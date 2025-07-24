::Pizza Simulator Lite by (REDACTED)
::Feb 26, 2021


@echo off
title Pizza Simulator Lite v1.1
mode con cols=60 lines=20
color 0a
set guest=0
:guestplayer
set guest=1
set user=Guest%random%
:newplayer
set user=%user%
set colorcode=0a
set money=0
set cheese=0
set pepperoni=0
set mushroom=0
set onion=0
set sausage=0
set bacon=0
set pineapple=0
set cmachine=1
set pmachine=0
set mmachine=0
set omachine=0
set smachine=0
set bmachine=0
set pimachine=0
set cmachineprice=25
set pmachineprice=100
set mmachineprice=200
set omachineprice=350
set smachineprice=600
set bmachineprice=950
set pimachineprice=1400
set code_money=0



::Main menu

:menu
cls
echo = %user% = $%money% =
echo.
echo Menu
echo.
echo [1] Bake
echo [2] Sell
echo [3] Buy
echo [4] Settings
echo.
choice /c:1234 /n
if errorlevel 4 goto settings
if errorlevel 3 goto upgrade
if errorlevel 2 goto sell
if errorlevel 1 goto bake



::All settings

:settings
cls
echo Settings
echo.
echo [1] Stats
echo [2] Color
echo [3] Cheatcodes
echo [4] Reset Data
echo [5] Menu
echo.
choice /c:12345 /n
if errorlevel 5 goto menu
if errorlevel 4 goto accreset
if errorlevel 3 goto cheatcodes
if errorlevel 2 goto colorset
if errorlevel 1 goto mystats
:colorset
cls
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
color %color_attrib1%%color_attrib2%
goto settings
:cheatcodes
cls
echo Enter a cheat code or 'back' to go back:
echo.
set /p cheatcode=">> "
if %cheatcode%==money (
if %code_money%==1 goto cheatcodes
set code_money=1
set /a money=%money% +1000
echo.
echo You've been rewarded $1,000.
echo Thanks for support.
pause>nul
)
if %cheatcode%==back goto settings
goto cheatcodes
:accreset
cls
echo Are you sure you want to reset all your data? [y/n]
echo.
choice /c:yn /n
if errorlevel 2 goto settings
goto newplayer
:mystats
cls
echo %user%'s stats:
echo.
echo Money: $%money%
echo.
echo Pizza
echo Cheese:    %cheese%
echo Pepperoni: %pepperoni%
echo Mushroom:  %mushroom%
echo Onion:     %onion%
echo Sausage:   %sausage%
echo Bacon:     %bacon%
echo Pineapple: %pineapple%
echo.
echo Press any key to go back . . .
pause>nul
goto settings



::Sell pizza

:sell
cls
echo = %user% = $%money% =
echo.
echo Choose the pizza you want to sell:
echo.
echo [1] Cheese         $1
echo [2] Pepperoni      $2
echo [3] Mushroom       $4
echo [4] Onion          $6
echo [5] Sausage        $10
echo [6] Bacon          $14
echo [7] Pineapple      $20
echo [8] Back
echo.
choice /c:12345678 /n
echo.
if errorlevel 8 goto menu
if errorlevel 7 goto sellpineapple
if errorlevel 6 goto sellbacon
if errorlevel 5 goto sellsausage
if errorlevel 4 goto sellonion
if errorlevel 3 goto sellmushroom
if errorlevel 2 goto sellpepperoni
if errorlevel 1 goto sellcheese
:sellcheese
echo How many cheese pizzas do you want to sell or 'all'?
echo You have %cheese%.
set /p cheesesold=">> "
if %cheesesold%==all set /a cheesesold=%cheese%
if %cheesesold% gtr %cheese% goto sellerror
if %cheesesold% lss 0 goto sellerror
set /a cheese=%cheese% -%cheesesold%
set /a money=%money% +(%cheesesold% *1)
goto sell
:sellpepperoni
echo How many pepperoni pizzas do you want to sell or 'all'?
echo You have %pepperoni%.
set /p pepperonisold=">> "
if %pepperonisold%==all set /a pepperonisold=%pepperoni%
if %pepperonisold% gtr %pepperoni% goto sellerror
if %pepperonisold% lss 0 goto sellerror
set /a pepperoni=%pepperoni% -%pepperonisold%
set /a money=%money% +(%pepperonisold% *2)
goto sell
:sellmushroom
echo How many mushroom pizzas do you want to sell or 'all'?
echo You have %mushroom%.
set /p mushroomsold=">> "
if %mushroomsold%==all set /a mushroomsold=%mushroom%
if %mushroomsold% gtr %mushroom% goto sellerror
if %mushroomsold% lss 0 goto sellerror
set /a mushroom=%mushroom% -%mushroomsold%
set /a money=%money% +(%mushroomsold% *4)
goto sell
:sellonion
echo How many onion pizzas do you want to sell or 'all'?
echo You have %onion%.
set /p onionsold=">> "
if %onionsold%==all set /a onionsold=%onion%
if %onionsold% gtr %onion% goto sellerror
if %onionsold% lss 0 goto sellerror
set /a onion=%onion% -%onionsold%
set /a money=%money% +(%onionsold% *6)
goto sell
:sellsausage
echo How many sausage pizzas do you want to sell or 'all'?
echo You have %sausage%.
set /p sausagesold=">> "
if %sausagesold%==all set /a sausagesold=%sausage%
if %sausagesold% gtr %sausage% goto sellerror
if %sausagesold% lss 0 goto sellerror
set /a sausage=%sausage% -%sausagesold%
set /a money=%money% +(%sausagesold% *10)
goto sell
:sellbacon
echo How many bacon pizzas do you want to sell or 'all'?
echo You have %bacon%.
set /p baconsold=">> "
if %baconsold%==all set /a baconsold=%bacon%
if %baconsold% gtr %bacon% goto sellerror
if %baconsold% lss 0 goto sellerror
set /a bacon=%bacon% -%baconsold%
set /a money=%money% +(%baconsold% *14)
goto sell
:sellpineapple
echo How many pineapple pizzas do you want to sell or 'all'?
echo You have %pineapple%.
set /p pineapplesold=">> "
if %pineapplesold%==all set /a pineapplesold=%pineapple%
if %pineapplesold% gtr %pineapple% goto sellerror
if %pineapplesold% lss 0 goto sellerror
set /a pineapple=%pineapple% -%pineapplesold%
set /a money=%money% +(%pineapplesold% *20)
goto sell
:sellerror
echo.
echo You cannot sell that much.
pause>nul
goto sell



::Upgrade

:upgrade
cls
echo = %user% = $%money% =
echo.
echo Choose what you want to buy:
echo.
echo [1] Cheese pizza machine (%cmachine%) $%cmachineprice%
echo [2] Pepperoni pizza machine (%pmachine%) $%pmachineprice%
echo [3] Mushroom pizza machine (%mmachine%) $%mmachineprice%
echo [4] Onion pizza machine (%omachine%) $%omachineprice%
echo [5] Sausage pizza machine (%smachine%) $%smachineprice%
echo [6] Bacon pizza machine (%bmachine%) $%bmachineprice%
echo [7] Pineapple pizza machine (%pimachine%) $%pimachineprice%
echo [8] Back
echo.
choice /c:12345678 /n
if errorlevel 8 goto menu
if errorlevel 7 goto buypineapple
if errorlevel 6 goto buybacon
if errorlevel 5 goto buysausage
if errorlevel 4 goto buyonion
if errorlevel 3 goto buymushroom
if errorlevel 2 goto buypepperoni
if errorlevel 1 goto buycheese
:buycheese
if %money% lss %cmachineprice% goto buyerror
set /a cmachine=%cmachine% +1
set /a money=%money% -%cmachineprice%
set /a cmachineprice=%cmachineprice% +15
goto upgrade
:buypepperoni
if %money% lss %pmachineprice% goto buyerror
set /a pmachine=%pmachine% +1
set /a money=%money% -%pmachineprice%
set /a pmachineprice=%pmachineprice% +30
goto upgrade
:buymushroom
if %money% lss %mmachineprice% goto buyerror
set /a mmachine=%mmachine% +1
set /a money=%money% -%mmachineprice%
set /a mmachineprice=%mmachineprice% +60
goto upgrade
:buyonion
if %money% lss %omachineprice% goto buyerror
set /a omachine=%omachine% +1
set /a money=%money% -%omachineprice%
set /a omachineprice=%omachineprice% +120
goto upgrade
:buysausage
if %money% lss %smachineprice% goto buyerror
set /a smachine=%smachine% +1
set /a money=%money% -%smachineprice%
set /a smachineprice=%smachineprice% +320
goto upgrade
:buybacon
if %money% lss %bmachineprice% goto buyerror
set /a bmachine=%bmachine% +1
set /a money=%money% -%bmachineprice%
set /a bmachineprice=%bmachineprice% +640
goto upgrade
:buypineapple
if %money% lss %pimachineprice% goto buyerror
set /a pimachine=%pimachine% +1
set /a money=%money% -%pimachineprice%
set /a pimachineprice=%pimachineprice% +1280
goto upgrade
:buyerror
echo.
echo You do not have enough money to buy that.
pause>nul
goto upgrade



::Bake pizza

:bake
set round=0
:bakeround
set /a cheese=%cheese% +%cmachine%
set /a pepperoni=%pepperoni% +%pmachine%
set /a mushroom=%mushroom% +%mmachine%
set /a onion=%onion% +%omachine%
set /a sausage=%sausage% +%smachine%
set /a bacon=%bacon% +%bmachine%
set /a pineapple=%pineapple% +%pimachine%
set /a round=%round% +1
call :bakedisplay
if %round%==25 (
ping localhost -n 2 >nul
goto menu
)
goto bakeround
:bakedisplay
cls
echo . . . Baking Pizza . . .
echo.
echo Press [Enter] to rush
echo.
echo Cheese:    %cheese%
echo Pepperoni: %pepperoni%
echo Mushroom:  %mushroom%
echo Onion:     %onion%
echo Sausage:   %sausage%
echo Bacon:     %bacon%
echo Pineapple: %pineapple%
goto :eof