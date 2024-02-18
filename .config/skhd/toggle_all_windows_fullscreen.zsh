#!/usr/bin/env zsh

windows=$(yabai -m query --spaces --space mouse | jq '.windows | .[]')

for window (${(f)windows}); do
  yabai -m window $window --toggle zoom-fullscreen 
done

