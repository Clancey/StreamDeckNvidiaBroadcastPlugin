REM USAGE: Install.bat <DEBUG/RELEASE> <UUID>
REM Example: Install.bat RELEASE com.barraider.spotify
setlocal
cd /d %~dp0
REM cd %1

REM *** MAKE SURE THE FOLLOWING VARIABLES ARE CORRECT ***
REM (Distribution tool be downloaded from: https://developer.elgato.com/documentation/stream-deck/sdk/exporting-your-plugin/ )
SET OUTPUT_DIR=%temp%
SET DISTRIBUTION_TOOL="DistributionTool.exe"
SET STREAM_DECK_FILE="C:\Program Files\Elgato\StreamDeck\StreamDeck.exe"
SET STREAM_DECK_LOAD_TIMEOUT=7

taskkill /f /im streamdeck.exe
taskkill /f /im com.zaphop.nvidiabroadcast.exe
timeout /t 2
del %OUTPUT_DIR%\com.zaphop.nvidiabroadcast.streamDeckPlugin
%DISTRIBUTION_TOOL% -b -i C:\Source\Home\StreamDeckTest2\bin\Debug\com.zaphop.nvidiabroadcast.sdPlugin -o %OUTPUT_DIR%
rmdir %APPDATA%\Elgato\StreamDeck\Plugins\com.zaphop.nvidiabroadcast.sdPlugin /s /q
START "" %STREAM_DECK_FILE%
timeout /t %STREAM_DECK_LOAD_TIMEOUT%
%OUTPUT_DIR%\com.zaphop.nvidiabroadcast.streamDeckPlugin
