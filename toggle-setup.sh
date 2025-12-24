#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Setup
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./assets/settings-icon.png
# @raycast.packageName Settings Utils

# Documentation:
# @raycast.description Toggle the setup (HOME/PORTABLE)
# @raycast.author lil-poop
# @raycast.authorURL https://raycast.com/lil-poop

# Run toggle-scroll and capture output
scroll_result=$(/Users/rcari/Documents/Raycast/settings/toggle-scroll)

# Run toggle-keyboard and capture output
keyboard_result=$(/Users/rcari/Documents/Raycast/settings/toggle-keyboard)

# Print combined result
echo "$scroll_result | $keyboard_result"
