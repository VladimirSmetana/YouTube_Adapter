@echo off

sc stop "GoodbyeDPI"
sc delete "GoodbyeDPI"
sc stop "WinDivert"
sc delete "WinDivert"

pushd "%~dp0"
set _arch=x86
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
if defined PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -9 -e1 -q --fake-gen 29 --fake-from-hex 79d95dce6965489fc19ea13cbd920fd245831974e9ec8bfd9aaeefd6b0a211114d97bd8479b41f7e9f3699646050a40be386e1d0e1c98a9ee173 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\russia-youtube.txt\"" start= "auto"

sc description "GoodbyeDPI" "Passive Deep Packet Inspection blocker and Active DPI circumvention utility"

sc start "GoodbyeDPI"

popd
echo.
pause