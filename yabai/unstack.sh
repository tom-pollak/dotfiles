#!/bin/bash

start_window=$(yabai -m query --windows --window | jq -r '.id')
yabai -m window --focus $start_window
window_data=$(yabai -m query --windows --window stack.next || yabai -m query --windows --window stack.first)
window=$(echo "$window_data" | jq -r '.id')
echo "$start_window $window"

# Loop while the window ID is not empty
while [ -n "$window" ]; do
  echo "$start_window $window"

  # Toggle the float status twice to ensure no actual change
  yabai -m window $window --toggle float
  yabai -m window $window --toggle float

  # Refocus the start window
  yabai -m window --focus $start_window

  # Get the next window's ID
  window_data=$(yabai -m query --windows --window stack.next || yabai -m query --windows --window stack.first)
  window=$(echo "$window_data" | jq -r '.id')
done

# Refocus the start window at the end
yabai -m window --focus $start_window


##!/bin/bash


#start_window=$(yabai -m query --windows --window stack.next || yabai -m query --windows --window stack.first | jq -r '.id')

#yabai -m window --focus $start_window
#window=$(yabai -m query --windows --window stack.next || yabai -m query --windows --window stack.first | jq -r '.id')
#echo "$start_window $window"

## Loop while window is not an empty string
#while [ -n "$window" ]; do
#  echo "$start_window $window"
#  /opt/homebrew/bin/yabai -m window $window --toggle float
#  /opt/homebrew/bin/yabai -m window $window --toggle float
#  yabai -m window --focus $start_window
#  window=$(yabai -m query --windows --window stack.next || yabai -m query --windows --window stack.first | jq -r '.id')
#done

#yabai -m window --focus $start_window

##!/bin/bash
#window=$(yabai -m query --windows --window stack.next || yabai -m query --windows --window stack.first | jq -r '.id')

#echo $?
#echo "window: "$window""
#/opt/homebrew/bin/yabai -m window $window --toggle float
#/opt/homebrew/bin/yabai -m window $window --toggle float
