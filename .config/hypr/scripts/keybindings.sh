#!/bin/bash
#  _              _     _           _ _                  
# | | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___  
# | |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __| 
# |   <  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \ 
# |_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/ 
#           |___/                             |___/      
# by Stephan Raabe (2024) 
# ----------------------------------------------------- 

config_file=~/.config/hypr/conf/binds.lua
echo "Reading from: $config_file"

# One line per hl.bind(...): "MOD + KEY<CR>comment" (comment = trailing "-- ..." on the same line)
keybinds="$(sed -n -E '
  /^hl\.bind\(/ {
    s/^hl\.bind\(//
    s/mainMod \.\. " \+ /"SUPER + /
    s/^"([^"]*)".*--[[:space:]]*(.*)$/\1\r\2/
    s/^"([^"]*)".*$/\1\r/
    p
  }' "$config_file")"
keybinds="$keybinds"$'\n'"SUPER + 1..0"$'\r'"Switch to workspace 1..10"$'\n'"SUPER + SHIFT + 1..0"$'\r'"Move window to workspace 1..10"

sleep 0.2
rofi -dmenu -i -markup -eh 2 -replace -p "Keybinds" <<< "$keybinds"
