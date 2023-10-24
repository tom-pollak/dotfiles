on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running

if not is_running("/Applications/Google Chrome.app") then
	tell application "/Applications/Google Chrome.app" to activate
else
	tell application "System Events" to tell process "/Applications/Google Chrome.app"
		click menu item "New Window" of menu 1 of menu bar item "File" of menu bar 1
	end tell
end if
