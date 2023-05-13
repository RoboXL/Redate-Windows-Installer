@echo off

REM Define variables
set "repoUrl=https://github.com/RoboXL/UpdateX-Windows/archive/refs/heads/main.zip"
set "tempDir=%TEMP%"
set "downloadPath=%tempDir%\UpdateX.zip"
set "extractPath=%tempDir%\UpdateX"
set "scriptPath=%extractPath%\UpdateX-Windows-main\UpdateX.bat"
set "updateScriptPath=%extractPath%\UpdateX-Windows-main\Update UpdateX.bat"
set "destinationFolder=%USERPROFILE%\UpdateX"
set "destinationPath=%destinationFolder%\UpdateX.bat"
set "updateScriptDestinationPath=%destinationFolder%\Update UpdateX.bat"
set "shortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\UpdateX.lnk"
set "updateShortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Update UpdateX.lnk"

REM Prompt to confirm installation
echo UpdateX-Windows installation
echo Run this again to update UpdateX
echo.
echo This script will install UpdateX-Windows to the following location:
echo  %destinationFolder%
echo.

set /p "choice=Do you want to continue with the installation? (Y/N): "
if /i "%choice%" neq "Y" exit

REM Download the repository zip file
powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('%repoUrl%', '%downloadPath%')"

REM Extract the contents of the zip file
powershell.exe -Command "Expand-Archive -Path '%downloadPath%' -DestinationPath '%extractPath%' -Force"

REM Create the destination folder if it doesn't exist
mkdir "%destinationFolder%" 2>nul

REM Move the scripts to the desired locations
move /Y "%scriptPath%" "%destinationPath%"
move /Y "%updateScriptPath%" "%updateScriptDestinationPath%"

REM Create a shortcut in the Start Menu folder for UpdateX-Windows
powershell.exe -Command "$shell = New-Object -ComObject WScript.Shell; $shortcut = $shell.CreateShortcut('%shortcutPath%'); $shortcut.TargetPath = '%destinationPath%'; $shortcut.Save()"

REM Create a shortcut in the Start Menu folder for Update UpdateX.bat
powershell.exe -Command "$shell = New-Object -ComObject WScript.Shell; $shortcut = $shell.CreateShortcut('%updateShortcutPath%'); $shortcut.TargetPath = '%updateScriptDestinationPath%'; $shortcut.Save()"

REM Clean up temporary files
del "%downloadPath%" /F /Q
rmdir "%extractPath%" /S /Q

echo.
echo UpdateX-Windows installation completed.

echo UpdateX completed.
echo.
pause


