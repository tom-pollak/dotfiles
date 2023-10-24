on is_running(appName)
	tell application "System Events" to set isRunning to (name of processes) contains appName
	return isRunning
end is_running

if not is_running("Electron") then
	tell application "/Applications/Visual Studio Code.app/Contents/MacOS/Electron" to activate
else
	tell application "System Events" to tell process "Electron"
		click menu item "New Window" of menu 1 of menu bar item "File" of menu bar 1
        # keystroke "n" using {command down, shift down}
	end tell
end if
