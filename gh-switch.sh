#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Switch GitHub Account
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./assets/gh-switch-icon.png
# @raycast.packageName GitHub Utils

# Documentation:
# @raycast.description Switch GitHub CLI account and show current user
# @raycast.author lil-poop
# @raycast.authorURL https://raycast.com/lil-poop

OUTPUT=$(gh auth switch 2>&1)

if [ $? -ne 0 ]; then
  echo "Failed to switch account"
  exit 1
fi

CURRENT_USER=$(echo "$OUTPUT" | awk '{print $NF}')
echo "Switched to: $CURRENT_USER"
