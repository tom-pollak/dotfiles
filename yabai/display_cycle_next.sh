#!/bin/bash
info=$(yabai -m query --displays)
last=$(echo $info | jq '.[-1]."has-focus"')

if [[ $last == "false" ]]; then
    yabai -m display --focus next
else
    yabai -m display --focus $(echo $info | jq '.[0].index')
fi
