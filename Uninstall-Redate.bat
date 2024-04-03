@echo off

REM Define variables
set "destinationFolder=%USERPROFILE%\Redate"
set "shortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Redate.lnk"
set "updateShortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Redate.lnk"
set "updateScriptPath=%destinationFolder%\Redate.bat"
set "adminScriptPath=%destinationFolder%\Redate.bat"
set "updateUpdateScriptPath=%destinationFolder%\Update Redate.bat"
set "updateUpdateShortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Update Redate.lnk"

REM Prompt to confirm uninstallation
echo ------------------------------
echo Redate-Windows Uninstallation
echo ------------------------------
echo:
echo This script will uninstall Redate-Windows from the following location:
echo -----------------------------
echo  %destinationFolder%
echo -----------------------------
echo:

set /p "choice=Do you want to continue with the uninstallation? (Y/N): "
if /i "%choice%" neq "Y" exit

REM Delete the Redate script and its folder
del /F /Q "%updateScriptPath%"
del /F /Q "%updateUpdateScriptPath%"
rmdir "%destinationFolder%" /Q

REM Delete the Redate-Windows shortcut from the Start Menu folder
del /F /Q "%shortcutPath%"

REM Delete the Redate Update script shortcut from the Start Menu folder
del /F /Q "%updateUpdateShortcutPath%"

echo:
echo Redate-Windows uninstallation completed.
echo:
pause
