#!/bin/bash
info=$(yabai -m query --displays)
first=$(echo $info | jq '.[0]."has-focus"')

if [[ $first == "false" ]]; then
    yabai -m display --focus prev
else
    yabai -m display --focus $(echo $info | jq '.[-1].index')
fi
