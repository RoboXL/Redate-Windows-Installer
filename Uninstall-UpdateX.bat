@echo off

REM Define variables
set "destinationFolder=%USERPROFILE%\UpdateX"
set "shortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\UpdateX.lnk"
set "updateShortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\UpdateX.lnk"
set "updateScriptPath=%destinationFolder%\UpdateX.bat"
set "updateUpdateScriptPath=%destinationFolder%\Update UpdateX.bat"
set "updateUpdateShortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Update UpdateX.lnk"

REM Prompt to confirm uninstallation
echo UpdateX-Windows Uninstallation
echo.
echo This script will uninstall UpdateX-Windows from the following location:
echo  %destinationFolder%
echo.

set /p "choice=Do you want to continue with the uninstallation? (Y/N): "
if /i "%choice%" neq "Y" exit

REM Delete the UpdateX script and its folder
del /F /Q "%updateScriptPath%"
del /F /Q "%updateUpdateScriptPath%"
rmdir "%destinationFolder%" /Q

REM Delete the UpdateX-Windows shortcut from the Start Menu folder
del /F /Q "%shortcutPath%"

REM Delete the UpdateX Update script shortcut from the Start Menu folder
del /F /Q "%updateUpdateShortcutPath%"

echo.
echo UpdateX-Windows uninstallation completed.
echo.
pause
