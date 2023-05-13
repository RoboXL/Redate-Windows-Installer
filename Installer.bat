@echo off

REM Define variables
set "repoUrl=https://github.com/RoboXL/UpdateX-Windows/archive/refs/heads/main.zip"
set "tempDir=%TEMP%"
set "downloadPath=%tempDir%\UpdateX-Windows.zip"
set "extractPath=%tempDir%\UpdateX-Windows"
set "scriptPath=%extractPath%\UpdateX-Windows-main\UpdateX-Windows.bat"
set "destinationFolder=%USERPROFILE%\UpdateX"
set "destinationPath=%destinationFolder%\UpdateX-Windows.bat"
set "shortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\UpdateX-Windows.lnk"

REM Download the repository zip file
powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('%repoUrl%', '%downloadPath%')"

REM Extract the contents of the zip file
powershell.exe -Command "Expand-Archive -Path '%downloadPath%' -DestinationPath '%extractPath%' -Force"

REM Create the destination folder if it doesn't exist
mkdir "%destinationFolder%" 2>nul

REM Move the script to the desired location
move /Y "%scriptPath%" "%destinationPath%"

REM Create a shortcut in the Start Menu folder
powershell.exe -Command "$shell = New-Object -ComObject WScript.Shell; $shortcut = $shell.CreateShortcut('%shortcutPath%'); $shortcut.TargetPath = '%destinationPath%'; $shortcut.Save()"

REM Create a folder in the user's Startup folder
mkdir "%startupFolder%" 2>nul

REM Clean up temporary files
del "%downloadPath%" /F /Q
rmdir "%extractPath%" /S /Q

echo UpdateX-Windows installation completed.

pause