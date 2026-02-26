#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Get GitHub User
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./assets/gh-user-icon.png
# @raycast.packageName GitHub Utils

# Documentation:
# @raycast.description Show the current GitHub CLI user
# @raycast.author lil-poop
# @raycast.authorURL https://raycast.com/lil-poop

CURRENT_USER=$(gh auth status 2>&1 | grep -A1 "Logged in" | grep "Active account: true" -B1 | awk '/Logged in/{print $(NF-1)}')

if [ -z "$CURRENT_USER" ]; then
  echo "Not logged in"
  exit 1
fi

echo "Current GitHub user: $CURRENT_USER"
