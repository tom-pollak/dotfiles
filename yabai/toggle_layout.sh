#!/bin/bash

# Query the current space and get its layout type
current_layout=$(yabai -m query --spaces --space | jq -r '.type')

# Check the current layout and toggle
if [ "$current_layout" == "bsp" ]; then
    # If the current layout is bsp, change to float
    yabai -m space --layout float
elif [ "$current_layout" == "float" ]; then
    # If the current layout is float, change to bsp
    yabai -m space --layout bsp
else
    echo "Unknown layout type: $current_layout"
fi
