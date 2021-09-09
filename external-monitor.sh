#!/bin/bash
if [[ $(wmctrl -m) =~ "i3"  ]]; then
    if [[ $(xrandr --query) =~ "DP-2 connected" ]]; then
        xrandr --output eDP-1 --off --output DP-1 --off --output DP-2 --primary --mode 3840x2160 --pos 0x0 --rotate normal --scale 0.8x0.8
        nitrogen --restore
    fi
fi
