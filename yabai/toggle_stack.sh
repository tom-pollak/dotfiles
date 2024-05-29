#!/bin/bash

window=$(/opt/homebrew/bin/yabai -m query --windows --window | /opt/homebrew/bin/jq -r '.id')

# Attempt to stack the window to the south
/opt/homebrew/bin/yabai -m window south --stack $window
if [[ $? -ne 0 ]]; then
    echo "south failed"
    # If failed, stack east
    /opt/homebrew/bin/yabai -m window east --stack $window
    if [[ $? -ne 0 ]]; then
        echo "east failed"
        # If both failed, unstack
        # Float and un-float the window to reinsert it into the BSP tree as a new window
        # /opt/homebrew/bin/yabai -m window --insert east
        /opt/homebrew/bin/yabai -m window $window --toggle float
        /opt/homebrew/bin/yabai -m window $window --toggle float
    fi
fi
