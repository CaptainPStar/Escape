@echo off

SETLOCAL ENABLEDELAYEDEXPANSION

       :: DEFINE the following variables where applicable to your install

    SET SOURCE=.\
    SET TARGET="C:\Users\Roy\My Documents\Arma 3\missions"
    


:: _________________________________________________________

echo.
echo     Please enter the path to your ArmA-Mission-Folder
set /P TARGET=
mklink /J "%TARGET%\co10_Escape.Altis" "%SOURCE%\co10_Escape.Altis"
echo Complete
pause