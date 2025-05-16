@echo off
setlocal enabledelayedexpansion

REM Set the root folder to start searching
set "ROOT_DIR=%~1"
if "%ROOT_DIR%"=="" set "ROOT_DIR=%cd%"

echo Searching for .flac files in: %ROOT_DIR%
echo.

REM Loop through all .flac files recursively
for /r "%ROOT_DIR%" %%F in (*.flac) do (
    set "INPUT=%%F"
    set "OUTPUT=%%~dpF%%~nF.mp3"

    echo Converting: !INPUT!
    ffmpeg -i "!INPUT!" -c:a libmp3lame -q:a 0 "!OUTPUT!"
    echo.
)

echo Done.
pause
