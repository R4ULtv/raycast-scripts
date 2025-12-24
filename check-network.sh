#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Check Network
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./assets/network-icon.png
# @raycast.packageName Network Utils

# Documentation:
# @raycast.description Check network connectivity and latency
# @raycast.author lil-poop
# @raycast.authorURL https://raycast.com/lil-poop

# Ping 1.1.1.1 3 times and get average latency
PING_OUTPUT=$(ping -c 3 1.1.1.1 2>&1)

if [ $? -eq 0 ]; then
    # Extract average from the stats line (e.g., "round-trip min/avg/max/stddev = 18.624/21.861/22.933/1.374 ms")
    AVG_LATENCY=$(echo "$PING_OUTPUT" | grep -E 'round-trip|rtt' | sed 's/.*= //' | awk -F'/' '{print $2}')

    if [ -n "$AVG_LATENCY" ]; then
        echo "Average latency: ${AVG_LATENCY} ms"
    else
        echo "Could not parse latency"
        exit 1
    fi
else
    echo "Failed to ping 1.1.1.1"
    exit 1
fi
