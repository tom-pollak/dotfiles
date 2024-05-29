#!/bin/bash
window=$(/opt/homebrew/bin/yabai -m query --windows --window | /opt/homebrew/bin/jq -r '.id')
yabai -m window --display prev || yabai -m window --display last
yabai -m window --focus $window # yabai -m space --focus prev

