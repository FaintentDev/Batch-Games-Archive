@echo off
title The Useless Game
mode con cols=40 lines=12



:restart
set score=0
color 0b
:type
cls
set /a chance=%random% *36 /32768 +1
if %chance%==1 set key=A
if %chance%==2 set key=B
if %chance%==3 set key=C
if %chance%==4 set key=D
if %chance%==5 set key=E
if %chance%==6 set key=F
if %chance%==7 set key=G
if %chance%==8 set key=H
if %chance%==9 set key=I
if %chance%==10 set key=J
if %chance%==11 set key=K
if %chance%==12 set key=L
if %chance%==13 set key=M
if %chance%==14 set key=N
if %chance%==15 set key=O
if %chance%==16 set key=P
if %chance%==17 set key=Q
if %chance%==18 set key=R
if %chance%==19 set key=S
if %chance%==20 set key=T
if %chance%==21 set key=U
if %chance%==22 set key=V
if %chance%==23 set key=W
if %chance%==24 set key=X
if %chance%==25 set key=Y
if %chance%==26 set key=Z
if %chance%==27 set key=1
if %chance%==28 set key=2
if %chance%==29 set key=3
if %chance%==30 set key=4
if %chance%==31 set key=5
if %chance%==32 set key=6
if %chance%==33 set key=7
if %chance%==34 set key=8
if %chance%==35 set key=9
if %chance%==36 set key=0
echo Type
echo ษอออป
echo บ %key% บ
echo ศอออผ
echo.
echo.
echo.
echo.
echo Score: %score%
choice /c:abcdefghijklmnopqrstuvwxyz1234567890 /n
if %errorlevel%==%chance% goto next
goto endgame
:next
set /a score+=1
goto type
:endgame
cls
color 0c
call highscore.bat
if %score% gtr %highscore% goto newhigh
echo ษออออออออออป
echo บ YOU LOSE บ
echo ศออออออออออผ
echo Score: %score%
echo Highscore: %highscore%
echo.
echo Press [Enter] to play again . . .
pause>nul
goto restart
:newhigh
(
echo set highscore=%score%
)>highscore.bat
goto endgame
