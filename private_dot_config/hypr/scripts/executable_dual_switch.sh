#!/usr/bin/env bash

# 1. Get current focused monitor
current_mon=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

# 2. Define targets
ws_hdmi=$1
ws_dp=$(($1 + 10))

# 3. Determine Order: Switch the BACKGROUND monitor first, ACTIVE monitor second.
if [ "$current_mon" == "HDMI-A-1" ]; then
    # Active is HDMI: Switch DP first, then HDMI
    hyprctl --batch "dispatch workspace $ws_dp ; dispatch workspace $ws_hdmi"
else
    # Active is DP (or other): Switch HDMI first, then DP
    hyprctl --batch "dispatch workspace $ws_hdmi ; dispatch workspace $ws_dp"
fi

