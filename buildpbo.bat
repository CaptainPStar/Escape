@echo off
echo Starting build...

echo BUILD NR: %BUILD_NUMBER% > %WORKSPACE%\version.txt
echo COMMIT: %GIT_COMMIT% >> %WORKSPACE%\version.txt
echo BRANCH: %GIT_BRANCH% >> %WORKSPACE%\version.txt
echo BUILD INFO: %BUILD_URL% >> %WORKSPACE%\version.txt
echo  AUTHOR: %GIT_AUTHOR_EMAIL% >> %WORKSPACE%\version.txt
echo  COMMITTER: %GIT_COMMITTER_EMAIL%  >> %WORKSPACE%\version.txt

del %WORKSPACE%\co10_escape.altis\include\build.hpp /f /q
echo #define BUILD %BUILD_NUMBER% >> %WORKSPACE%\checkout\co10_escape.altis\include\build.hpp
echo  #define COMMITTER %GIT_COMMITTER_EMAIL% >> %WORKSPACE%\checkout\co10_escape.altis\include\build.hpp
echo Copied over folder to binned folder
"C:\Program Files (x86)\Bohemia Interactive\Tools\BinPBO Personal Edition\BinPBO.exe" "%WORKSPACE%\checkout\co10_escape.altis" "%WORKSPACE%" -DEBUG -PREFIX ""
echo Created PBOs
xcopy "%WORKSPACE%\co10_escape.altis.pbo" "C:\Server\Apache2.4\htdocs\escape.anzp.de\co10_escape_build%BUILD_NUMBER%.altis.pbo*"
echo PBO copied to webserver
if not exist %WORKSPACE%\co10_escape.altis.pbo exit /b 1