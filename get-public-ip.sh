#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Get Public IPv4
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./assets/network-icon.png
# @raycast.packageName Network Utils

# Documentation:
# @raycast.description Get the public IP address
# @raycast.author lil-poop
# @raycast.authorURL https://raycast.com/lil-poop

IP=$(dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d '"')
echo -n "$IP" | pbcopy
echo "Copied to clipboard: $IP"
