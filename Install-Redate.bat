@echo off

REM Define variables
set "repoUrl=https://github.com/RoboXL/Redate-Windows/archive/refs/heads/dev.zip"
set "tempDir=%TEMP%"
set "downloadPath=%tempDir%\Redate.zip"
set "extractPath=%tempDir%\Redate"
set "scriptPath=%extractPath%\Redate-Windows-dev\Redate.bat"
set "updateScriptPath=%extractPath%\Redate-Windows-dev\Update Redate.bat"
set "destinationFolder=%USERPROFILE%\Redate"
set "destinationPath=%destinationFolder%\Redate.bat"
set "updateScriptDestinationPath=%destinationFolder%\Update Redate.bat"
set "shortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Redate.lnk"
set "updateShortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Update Redate.lnk"

REM Prompt to confirm installation
echo ----------------------------
echo Redate-Windows installation
echo ----------------------------
echo:
echo Hey %username%.This script will install Redate-Windows Beta to the following location:
echo -----------------------------
echo  %destinationFolder%
echo -----------------------------
echo:

set /p "choice=Do you want to continue with the installation? (Y/N): "
if /i "%choice%" neq "Y" exit

REM Download the repository zip file
echo:
echo --------------------------------------
powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('%repoUrl%', '%downloadPath%')"
echo --------------------------------------
echo:

REM Extract the contents of the zip file
echo --------------------------------------
powershell.exe -Command "Expand-Archive -Path '%downloadPath%' -DestinationPath '%extractPath%' -Force"
echo --------------------------------------
echo:

REM Create the destination folder if it doesn't exist
mkdir "%destinationFolder%" 2>nul

REM Move the scripts to the desired locations
echo --------------------------------------
move /Y "%scriptPath%" "%destinationPath%"
echo --------------------------------------
echo:
echo --------------------------------------
move /Y "%updateScriptPath%" "%updateScriptDestinationPath%"
echo --------------------------------------

REM Create a shortcut in the Start Menu folder for UpdateX-Windows
powershell.exe -Command "$shell = New-Object -ComObject WScript.Shell; $shortcut = $shell.CreateShortcut('%shortcutPath%'); $shortcut.TargetPath = '%destinationPath%'; $shortcut.Save()"

REM Create a shortcut in the Start Menu folder for Update UpdateX.bat
powershell.exe -Command "$shell = New-Object -ComObject WScript.Shell; $shortcut = $shell.CreateShortcut('%updateShortcutPath%'); $shortcut.TargetPath = '%updateScriptDestinationPath%'; $shortcut.Save()"

REM Clean up temporary files
del "%downloadPath%" /F /Q
rmdir "%extractPath%" /S /Q



echo:
echo:---------------------------------------------------
echo: Redate-Windows installation completed. Test away!
echo:---------------------------------------------------
echo:
pause


