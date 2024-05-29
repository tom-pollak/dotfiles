#!/bin/bash
window=$(/opt/homebrew/bin/yabai -m query --windows --window | /opt/homebrew/bin/jq -r '.id')
yabai -m window --space next
yabai -m window --focus $window

