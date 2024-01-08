on is_running(appName)
    tell application "System Events" to (name of processes) contains appName
end is_running

if not is_running("Firefox") then
    tell application "Firefox" to activate
else
    tell application "System Events" to tell process "Firefox"
        click menu item "New Window" of menu 1 of menu bar item "File" of menu bar 1
        # delay 1 -- Wait for the new window to open
    end tell
    tell application "Firefox"
        set index of window 1 to 1 -- Bring the new window to the front
        activate -- Focus on Firefox
    end tell
end if
