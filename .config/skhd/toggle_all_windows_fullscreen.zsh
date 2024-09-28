#!/usr/bin/env zsh

# if window is already in stack layout then toggle it to bsp
if [ $(yabai -m query --spaces --space | jq '.type') = '"stack"' ]; then
  yabai -m config layout bsp
  yabai -m config window_placement second_child
else 
  yabai -m config layout stack
  yabai -m config --space 3 layout stack
  yabai -m space --layout stack
  yabai -m window --focus stack.first
  yabai -m window --focus stack.prev
  yabai -m window --focus stack.next
  yabai -m window --focus stack.recent
  yabai -m window --focus stack.last
fi
