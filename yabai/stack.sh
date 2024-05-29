#!/bin/bash

window=$(yabai -m query --windows --window | jq -r '.id')
yabai -m window --stack next
yabai -m window --focus $window
