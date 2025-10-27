@echo off
setlocal enabledelayedexpansion

REM Set the root folder to start searching
set "ROOT_DIR=%~1"
if "%ROOT_DIR%"=="" set "ROOT_DIR=%cd%"

REM Check if delete flag is passed
set "DELETE_FLAG=%~2"

echo Searching for .flac files in: %ROOT_DIR%
echo.

REM Loop through all .flac files recursively
for /r "%ROOT_DIR%" %%F in (*.flac) do (
    set "INPUT=%%F"
    set "OUTPUT=%%~dpF%%~nF.mp3"
    set "COVER=%%~dpFcover.jpg"

    echo Converting: !INPUT!

    if exist "!COVER!" (
        ffmpeg -i "!INPUT!" -i "!COVER!" -map 0:a -map 1:v ^
            -c:a libmp3lame -q:a 0 -id3v2_version 3 -c:v copy ^
            "!OUTPUT!"
    ) else (
        ffmpeg -i "!INPUT!" -c:a libmp3lame -q:a 0 "!OUTPUT!"
    )

    if /i "!DELETE_FLAG!"=="--delete-original" (
        echo Deleting original: !INPUT!
        del "!INPUT!"
    )
    echo.
)

echo Done.
pause
