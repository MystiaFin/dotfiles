#!/bin/bash
STATE_FILE="/tmp/hypr-col-toggle"
DEFAULT=0.8

if [ -f "$STATE_FILE" ]; then
    rm "$STATE_FILE"
    hyprctl dispatch layoutmsg "colresize $DEFAULT"
else
    touch "$STATE_FILE"
    hyprctl dispatch layoutmsg "colresize 1.0"
fi
