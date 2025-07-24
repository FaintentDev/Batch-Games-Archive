
<!-- : Begin batch script

::Preload
@echo off
title Gacha Grinder
mode con cols=55 lines=30
cd data
set d=%date%
set m=100
call :res
call :load
start /b cscript //nologo "%~f0?.wsf" //job:music "main.mp3"


:menu
cls
if not "%d%"=="%date%" goto daily
call :save
echo.
echo  ~ $%m% ~
echo.
echo         { Shop }
echo  =======================
echo   1. Normal Box   $10
echo   2. Super Box    $150
echo   3. Legend Box   $500
echo   4. Unreal Box   $3500
::Normal (60,24,10,5,1)
::Super (40,40,12,7,1)
echo  =======================
echo.
echo  Q. Collection
choice /c:1234q /n
if errorlevel 5 goto col
if errorlevel 2 (
if %m% lss 150 goto menu
set /a m-=150
set box=Super
set l-=1
set sr-=2
set sr+=8
set r-=9
set r+=20
set uc-=21
set uc+=60
set c+=61
goto open
)
if errorlevel 1 (
if %m% lss 10 goto menu
set /a m-=10
set box=Normal
set l-=1
set sr-=2
set sr+=6
set r-=7
set r+=16
set uc-=17
set uc+=40
set c+=41
goto open
)


:daily
cls
set d=%date%
set r=0
set /a r+=(%Wimpmon%+%Medimon%+%Slakamon%+%Riomon%+%Finnemon%+%Tynamon%+%Mushamon%+%Drilmon%+%Sewamon%+%Elgymon%+%Girafamon%+%Inkamon%+%Koffimon%+%Slowmon%+%Drowmon%+%Shroomon%+%Sgraggimon%+%Dwebblemon%+%Slugamon%+%Shedimon%) *2
set /a r+=(%Joltamon%+%Heramon%+%Poimon%+%Wynamon%+%Slandimon%+%Litmon%+%Steelmon%+%Cosmon%+%Steamon%+%Bulumon%+%Arbomon%+%Voltormon%+%Mareemon%+%Flaffamon%+%Charmon%+%Torramon%+%Keclemon%+%Yungoomon%+%Shuppemon%+%Pumpkamon%) *5
set /a r+=(%Yanamon%+%Fraxmon%+%Tapumon%+%Dragomon%+%Vikamon%+%Electromon%+%Vigomon%+%Cryomon%+%Skorumon%+%Exemon%+%Honemon%+%Solromon%+%Pachimon%+%Cyndamon%+%Oricorimon%+%Dratimon%+%Pikimon%+%Dodumon%+%Persimon%+%Skitimon%) *10
set /a r+=(%Amoongumon%+%Gumshoomon%+%Pyukumon%+%Victimon%+%Stakamon%+%Latimon%+%Delphomon%+%Volcaromon%+%Drifblimon%+%Amphomon%+%Combuskamon%+%Moltremon%+%Arcemon%+%Tranqumon%+%Zangoomon%+%Trumbeemon%+%Dunsparmon%+%Wismumon%+%Articumon%+%Kokomon%) *25
set /a r+=(%Yveltamon%+%Zardomon%+%Reshiramon%+%Zoromon%+%Dreamiumon%+%Monfernomon%+%Rimurumon%+%Zekromon%+%Eevikurumon%+%Calyrexomon%) *100
set /a m+=%r%
echo.
echo Daily Login Reward!
echo.
echo  + $%r%
pause>nul
goto menu


:col
cls
mode con cols=55 lines=60
echo.
echo  -=[ Collection ]=-
echo.
echo  Common:
if %Wimpmon% gtr 0 echo Wimpmon (%Wimpmon%)
if %Medimon% gtr 0 echo Medimon (%Medimon%)
if %Slakamon% gtr 0 echo Slakamon (%Slakamon%)
if %Riomon% gtr 0 echo Riomon (%Riomon%)
if %Finnemon% gtr 0 echo Finnemon (%Finnemon%)
if %Tynamon% gtr 0 echo Tynamon (%Tynamon%)
if %Mushamon% gtr 0 echo Mushamon (%Mushamon%)
if %Drilmon% gtr 0 echo Drilmon (%Drilmon%)
if %Sewamon% gtr 0 echo Sewamon (%Sewamon%)
if %Elgymon% gtr 0 echo Elgymon (%Elgymon%)
if %Girafamon% gtr 0 echo Girafamon (%Girafamon%)
if %Inkamon% gtr 0 echo Inkamon (%Inkamon%)
if %Koffimon% gtr 0 echo Koffimon (%Koffimon%)
if %Slowmon% gtr 0 echo Slowmon (%Slowmon%)
if %Drowmon% gtr 0 echo Drowmon (%Drowmon%)
if %Shroomon% gtr 0 echo Shroomon (%Shroomon%)
if %Sgraggimon% gtr 0 echo Sgraggimon (%Sgraggimon%)
if %Dwebblemon% gtr 0 echo Dwebblemon (%Dwebblemon%)
if %Slugamon% gtr 0 echo Slugamon (%Slugamon%)
if %Shedimon% gtr 0 echo Shedimon (%Shedimon%)
echo.
echo  Uncommon:
if %Joltamon% gtr 0 echo Joltamon (%Joltamon%)
if %Heramon% gtr 0 echo Heramon (%Heramon%)
if %Poimon% gtr 0 echo Poimon (%Poimon%)
if %Wynamon% gtr 0 echo Wynamon (%Wynamon%)
if %Slandimon% gtr 0 echo Slandimon (%Slandimon%)
if %Litmon% gtr 0 echo Litmon (%Litmon%)
if %Steelmon% gtr 0 echo Steelmon (%Steelmon%)
if %Cosmon% gtr 0 echo Cosmon (%Cosmon%)
if %Steamon% gtr 0 echo Steamon (%Steamon%)
if %Bulumon% gtr 0 echo Bulumon (%Bulumon%)
if %Arbomon% gtr 0 echo Arbomon (%Arbomon%)
if %Voltormon% gtr 0 echo Voltormon (%Voltormon%)
if %Mareemon% gtr 0 echo Mareemon (%Mareemon%)
if %Flaffamon% gtr 0 echo Flaffamon (%Flaffamon%)
if %Charmon% gtr 0 echo Charmon (%Charmon%)
if %Torramon% gtr 0 echo Torramon (%Torramon%)
if %Keclemon% gtr 0 echo Keclemon (%Keclemon%)
if %Yungoomon% gtr 0 echo Yungoomon (%Yungoomon%)
if %Shuppemon% gtr 0 echo Shuppemon (%Shuppemon%)
if %Pumpkamon% gtr 0 echo Pumpkamon (%Pumpkamon%)
echo.
echo  Rare:
if %Yanamon% gtr 0 echo Yanamon (%Yanamon%)
if %Fraxmon% gtr 0 echo Fraxmon (%Fraxmon%)
if %Tapumon% gtr 0 echo Tapumon (%Tapumon%)
if %Dragomon% gtr 0 echo Dragomon (%Dragomon%)
if %Vikamon% gtr 0 echo Vikamon (%Vikamon%)
if %Electromon% gtr 0 echo Electromon (%Electromon%)
if %Vigomon% gtr 0 echo Vigomon (%Vigomon%)
if %Cryomon% gtr 0 echo Cryomon (%Cryomon%)
if %Skorumon% gtr 0 echo Skorumon (%Skorumon%)
if %Exemon% gtr 0 echo Exemon (%Exemon%)
if %Honemon% gtr 0 echo Honemon (%Honemon%)
if %Solromon% gtr 0 echo Solromon (%Solromon%)
if %Pachimon% gtr 0 echo Pachimon (%Pachimon%)
if %Cyndamon% gtr 0 echo Cyndamon (%Cyndamon%)
if %Oricorimon% gtr 0 echo Oricorimon (%Oricorimon%)
if %Dratimon% gtr 0 echo Dratimon (%Dratimon%)
if %Pikimon% gtr 0 echo Pikimon (%Pikimon%)
if %Dodumon% gtr 0 echo Dodumon (%Dodumon%)
if %Persimon% gtr 0 echo Persimon (%Persimon%)
if %Skitimon% gtr 0 echo Skitimon (%Skitimon%)
echo.
echo  Super:
if %Amoongumon% gtr 0 echo Amoongumon (%Amoongumon%)
if %Gumshoomon% gtr 0 echo Gumshoomon (%Gumshoomon%)
if %Pyukumon% gtr 0 echo Pyukumon (%Pyukumon%)
if %Victimon% gtr 0 echo Victimon (%Victimon%)
if %Stakamon% gtr 0 echo Stakamon (%Stakamon%)
if %Latimon% gtr 0 echo Latimon (%Latimon%)
if %Delphomon% gtr 0 echo Delphomon (%Delphomon%)
if %Volcaromon% gtr 0 echo Volcaromon (%Volcaromon%)
if %Drifblimon% gtr 0 echo Drifblimon (%Drifblimon%)
if %Amphomon% gtr 0 echo Amphomon (%Amphomon%)
if %Combuskamon% gtr 0 echo Combuskamon (%Combuskamon%)
if %Moltremon% gtr 0 echo Moltremon (%Moltremon%)
if %Arcemon% gtr 0 echo Arcemon (%Arcemon%)
if %Tranqumon% gtr 0 echo Tranqumon (%Tranqumon%)
if %Zangoomon% gtr 0 echo Zangoomon (%Zangoomon%)
if %Trumbeemon% gtr 0 echo Trumbeemon (%Trumbeemon%)
if %Dunsparmon% gtr 0 echo Dunsparmon (%Dunsparmon%)
if %Wismumon% gtr 0 echo Wismumon (%Wismumon%)
if %Articumon% gtr 0 echo Articumon (%Articumon%)
if %Kokomon% gtr 0 echo Kokomon (%Kokomon%)
echo.
echo  Legendary:
if %Yveltamon% gtr 0 echo Yveltamon (%Yveltamon%)
if %Zardomon% gtr 0 echo Zardomon (%Zardomon%)
if %Reshiramon% gtr 0 echo Reshiramon (%Reshiramon%)
if %Zoromon% gtr 0 echo Zoromon (%Zoromon%)
if %Dreamiumon% gtr 0 echo Dreamiumon (%Dreamiumon%)
if %Monfernomon% gtr 0 echo Monfernomon (%Monfernomon%)
if %Rimurumon% gtr 0 echo Rimurumon (%Rimurumon%)
if %Zekromon% gtr 0 echo Zekromon (%Zekromon%)
if %Eevikurumon% gtr 0 echo Eevikurumon (%Eevikurumon%)
if %Calyrexomon% gtr 0 echo Calyrexomon (%Calyrexomon%)
pause>nul
mode con cols=55 lines=30
goto menu


:open
set /a r=%random% * 100 / 32768 + 1
if %r% leq %l-% (
set rar=LGND)
if %r% geq %sr-% if %r% leq %sr+% (
set rar=SR)
if %r% geq %r-% if %r% leq %r+% (
set rar=R)
if %r% geq %uc-% if %r% leq %uc+% (
set rar=UC)
if %r% geq %c+% (
set rar=C)
goto %rar%
:C
set /a r=%random% * 20 / 32768 + 1
if %r%==1 set nam=Wimpmon
if %r%==2 set nam=Medimon
if %r%==3 set nam=Slakamon
if %r%==4 set nam=Riomon
if %r%==5 set nam=Finnemon
if %r%==6 set nam=Tynamon
if %r%==7 set nam=Mushamon
if %r%==8 set nam=Drilmon
if %r%==9 set nam=Sewamon
if %r%==10 set nam=Elgymon
if %r%==11 set nam=Girafamon
if %r%==12 set nam=Inkamon
if %r%==13 set nam=Koffimon
if %r%==14 set nam=Slowmon
if %r%==15 set nam=Drowmon
if %r%==16 set nam=Shroomon
if %r%==17 set nam=Dwebblemon
if %r%==18 set nam=Sgraggimon
if %r%==19 set nam=Slugamon
if %r%==20 set nam=Shedimon
goto final
:UC
set /a r=%random% * 20 / 32768 + 1
if %r%==1 set nam=Joltamon
if %r%==2 set nam=Heramon
if %r%==3 set nam=Wynamon
if %r%==4 set nam=Poimon
if %r%==5 set nam=Slandimon
if %r%==6 set nam=Steelmon
if %r%==7 set nam=Litmon
if %r%==8 set nam=Cosmon
if %r%==9 set nam=Steamon
if %r%==10 set nam=Bulumon
if %r%==11 set nam=Arbomon
if %r%==12 set nam=Voltormon
if %r%==13 set nam=Mareemon
if %r%==14 set nam=Flaffamon
if %r%==15 set nam=Charmon
if %r%==16 set nam=Torramon
if %r%==17 set nam=Keclemon
if %r%==18 set nam=Yungoomon
if %r%==19 set nam=Shuppemon
if %r%==20 set nam=Pumpkamon
goto final
:R
set /a r=%random% * 20 / 32768 + 1
if %r%==1 set nam=Yanamon
if %r%==2 set nam=Fraxmon
if %r%==3 set nam=Tapumon
if %r%==4 set nam=Dragomon
if %r%==5 set nam=Vikamon
if %r%==6 set nam=Electromon
if %r%==7 set nam=Vigomon
if %r%==8 set nam=Cryomon
if %r%==9 set nam=Skorumon
if %r%==10 set nam=Exemon
if %r%==11 set nam=Honemon
if %r%==12 set nam=Solromon
if %r%==13 set nam=Pachimon
if %r%==14 set nam=Cyndamon
if %r%==15 set nam=Oricorimon
if %r%==16 set nam=Dratimon
if %r%==17 set nam=Dodumon
if %r%==18 set nam=Pikimon
if %r%==19 set nam=Persimon
if %r%==20 set nam=Skitimon
goto final
:SR
set /a r=%random% * 20 / 32768 + 1
if %r%==1 set nam=Amoongumon
if %r%==2 set nam=Gumshoomon
if %r%==3 set nam=Pyukumon
if %r%==4 set nam=Victimon
if %r%==5 set nam=Stakamon
if %r%==6 set nam=Latimon
if %r%==7 set nam=Delphomon
if %r%==8 set nam=Volcaromon
if %r%==9 set nam=Drifblimon
if %r%==10 set nam=Amphomon
if %r%==11 set nam=Combuskamon
if %r%==12 set nam=Moltremon
if %r%==13 set nam=Arcemon
if %r%==14 set nam=Tranqumon
if %r%==15 set nam=Zangoomon
if %r%==16 set nam=Trumbeemon
if %r%==17 set nam=Dunsparmon
if %r%==18 set nam=Wismumon
if %r%==19 set nam=Articumon
if %r%==20 set nam=Kokomon
goto final
:LGND
set /a r=%random% * 10 / 32768 + 1
if %r%==1 set nam=Yveltamon
if %r%==2 set nam=Zardomon
if %r%==3 set nam=Reshiramon
if %r%==4 set nam=Zoromon
if %r%==5 set nam=Dreamiumon
if %r%==6 set nam=Monfernomon
if %r%==7 set nam=Rimurumon
if %r%==8 set nam=Zekromon
if %r%==9 set nam=Eevikurumon
if %r%==10 set nam=Calyrexomon
:final
set /a %nam%+=1
call :save
cls
echo.
echo  [ %box% Box ]
echo.
echo  You got a...
ping localhost -n 2 >nul
start /b cscript //nologo "%~f0?.wsf" //job:sound "open.mp3"
echo.
echo.
echo  * [%rar%] %nam%! *
ping localhost -n 2 >nul
echo.
echo.
echo  Continue...
pause>nul
goto menu





:res
set Wimpmon=0
set Medimon=0
set Slakamon=0
set Riomon=0
set Finnemon=0
set Tynamon=0
set Mushamon=0
set Drilmon=0
set Sewamon=0
set Elgymon=0
set Girafamon=0
set Inkamon=0
set Koffimon=0
set Slowmon=0
set Drowmon=0
set Shroomon=0
set Sgraggimon=0
set Dwebblemon=0
set Slugamon=0
set Shedimon=0
set Joltamon=0
set Heramon=0
set Poimon=0
set Wynamon=0
set Slandimon=0
set Litmon=0
set Steelmon=0
set Cosmon=0
set Steamon=0
set Bulumon=0
set Arbomon=0
set Voltormon=0
set Mareemon=0
set Flaffamon=0
set Charmon=0
set Torramon=0
set Keclemon=0
set Yungoomon=0
set Shuppemon=0
set Pumpkamon=0
set Yanamon=0
set Fraxmon=0
set Tapumon=0
set Dragomon=0
set Vikamon=0
set Electromon=0
set Vigomon=0
set Cryomon=0
set Skorumon=0
set Exemon=0
set Honemon=0
set Solromon=0
set Pachimon=0
set Cyndamon=0
set Oricorimon=0
set Dratimon=0
set Pikimon=0
set Dodumon=0
set Persimon=0
set Skitimon=0
set Amoongumon=0
set Gumshoomon=0
set Pyukumon=0
set Victimon=0
set Stakamon=0
set Latimon=0
set Delphomon=0
set Volcaromon=0
set Drifblimon=0
set Amphomon=0
set Combuskamon=0
set Moltremon=0
set Arcemon=0
set Tranqumon=0
set Zangoomon=0
set Trumbeemon=0
set Dunsparmon=0
set Wismumon=0
set Articumon=0
set Kokomon=0
set Yveltamon=0
set Zardomon=0
set Reshiramon=0
set Zoromon=0
set Dreamiumon=0
set Monfernomon=0
set Rimurumon=0
set Zekromon=0
set Eevikurumon=0
set Calyrexomon=0
goto :eof

:load
(
set /p d=
set /p m=
set /p Wimpmon=
set /p Medimon=
set /p Slakamon=
set /p Riomon=
set /p Finnemon=
set /p Tynamon=
set /p Mushamon=
set /p Drilmon=
set /p Sewamon=
set /p Elgymon=
set /p Girafamon=
set /p Inkamon=
set /p Koffimon=
set /p Slowmon=
set /p Drowmon=
set /p Shroomon=
set /p Sgraggimon=
set /p Dwebblemon=
set /p Slugamon=
set /p Shedimon=
set /p Joltamon=
set /p Heramon=
set /p Poimon=
set /p Wynamon=
set /p Slandimon=
set /p Litmon=
set /p Steelmon=
set /p Cosmon=
set /p Steamon=
set /p Bulumon=
set /p Arbomon=
set /p Voltormon=
set /p Mareemon=
set /p Flaffamon=
set /p Charmon=
set /p Torramon=
set /p Keclemon=
set /p Yungoomon=
set /p Shuppemon=
set /p Pumpkamon=
set /p Yanamon=
set /p Fraxmon=
set /p Tapumon=
set /p Dragomon=
set /p Vikamon=
set /p Electromon=
set /p Vigomon=
set /p Cryomon=
set /p Skorumon=
set /p Exemon=
set /p Honemon=
set /p Solromon=
set /p Pachimon=
set /p Cyndamon=
set /p Oricorimon=
set /p Dratimon=
set /p Pikimon=
set /p Dodumon=
set /p Persimon=
set /p Skitimon=
set /p Amoongumon=
set /p Gumshoomon=
set /p Pyukumon=
set /p Victimon=
set /p Stakamon=
set /p Latimon=
set /p Delphomon=
set /p Volcaromon=
set /p Drifblimon=
set /p Amphomon=
set /p Combuskamon=
set /p Moltremon=
set /p Arcemon=
set /p Tranqumon=
set /p Zangoomon=
set /p Trumbeemon=
set /p Dunsparmon=
set /p Wismumon=
set /p Articumon=
set /p Kokomon=
set /p Yveltamon=
set /p Zardomon=
set /p Reshiramon=
set /p Zoromon=
set /p Dreamiumon=
set /p Monfernomon=
set /p Rimurumon=
set /p Zekromon=
set /p Eevikurumon=
set /p Calyrexomon=
)<save.gacha
goto :eof

:save
(
echo %d%
echo %m%
echo %Wimpmon%
echo %Medimon%
echo %Slakamon%
echo %Riomon%
echo %Finnemon%
echo %Tynamon%
echo %Mushamon%
echo %Drilmon%
echo %Sewamon%
echo %Elgymon%
echo %Girafamon%
echo %Inkamon%
echo %Koffimon%
echo %Slowmon%
echo %Drowmon%
echo %Shroomon%
echo %Sgraggimon%
echo %Dwebblemon%
echo %Slugamon%
echo %Shedimon%
echo %Joltamon%
echo %Heramon%
echo %Poimon%
echo %Wynamon%
echo %Slandimon%
echo %Litmon%
echo %Steelmon%
echo %Cosmon%
echo %Steamon%
echo %Bulumon%
echo %Arbomon%
echo %Voltormon%
echo %Mareemon%
echo %Flaffamon%
echo %Charmon%
echo %Torramon%
echo %Keclemon%
echo %Yungoomon%
echo %Shuppemon%
echo %Pumpkamon%
echo %Yanamon%
echo %Fraxmon%
echo %Tapumon%
echo %Dragomon%
echo %Vikamon%
echo %Electromon%
echo %Vigomon%
echo %Cryomon%
echo %Skorumon%
echo %Exemon%
echo %Honemon%
echo %Solromon%
echo %Pachimon%
echo %Cyndamon%
echo %Oricorimon%
echo %Dratimon%
echo %Pikimon%
echo %Dodumon%
echo %Persimon%
echo %Skitimon%
echo %Amoongumon%
echo %Gumshoomon%
echo %Pyukumon%
echo %Victimon%
echo %Stakamon%
echo %Latimon%
echo %Delphomon%
echo %Volcaromon%
echo %Drifblimon%
echo %Amphomon%
echo %Combuskamon%
echo %Moltremon%
echo %Arcemon%
echo %Tranqumon%
echo %Zangoomon%
echo %Trumbeemon%
echo %Dunsparmon%
echo %Wismumon%
echo %Articumon%
echo %Kokomon%
echo %Yveltamon%
echo %Zardomon%
echo %Reshiramon%
echo %Zoromon%
echo %Dreamiumon%
echo %Monfernomon%
echo %Rimurumon%
echo %Zekromon%
echo %Eevikurumon%
echo %Calyrexomon%
)>save.gacha
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
	  Sound.settings.volume = 100
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