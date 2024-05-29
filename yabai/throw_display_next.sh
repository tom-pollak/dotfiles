#!/bin/bash
window=$(/opt/homebrew/bin/yabai -m query --windows --window | /opt/homebrew/bin/jq -r '.id')
yabai -m window --display next || yabai -m window --display first
yabai -m window --focus $window

