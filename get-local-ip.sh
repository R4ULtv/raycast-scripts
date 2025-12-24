#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Get Local IPv4
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./assets/network-icon.png
# @raycast.packageName Network Utils

# Documentation:
# @raycast.description Get the local/private IP address
# @raycast.author lil-poop
# @raycast.authorURL https://raycast.com/lil-poop

IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)

if [ -z "$IP" ]; then
    echo "No local IP found"
    exit 1
fi

echo -n "$IP" | pbcopy
echo "Copied to clipboard: $IP"
