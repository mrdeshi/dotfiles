#!/usr/bin/env bash

# Capture selected area and save to a temporary file
temp_file=$(mktemp --suffix=.png)
grim -g "$(slurp)" "$temp_file"

# Check if an area was actually selected
if [ -s "$temp_file" ]; then
    # Run tesseract, pipe to clipboard, and notify
    text=$(tesseract "$temp_file" - -l eng)
    echo "$text" | wl-copy
    notify-send "OCR Complete" "Text copied to clipboard"
else
    notify-send "OCR Canceled" "No area selected"
fi

# Clean up
rm "$temp_file"
