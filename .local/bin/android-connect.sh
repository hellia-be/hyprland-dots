#!/bin/bash

# --- CONFIGURATION ---
PHONE_IP="192.168.86.245" # Use your phone's actual IP
# ---------------------

# Attempt to connect if not already
if ! adb devices | grep -q "$PHONE_IP:5555"; then
  adb connect "$PHONE_IP:5555"
fi

# Check connection and launch
if adb devices | grep -q "$PHONE_IP:5555"; then
  # --no-window-border makes it look cleaner in tiling layouts
  scrcpy -s "$PHONE_IP:5555" \
    --turn-screen-off \
    --stay-awake \
    --video-bit-rate=12M \
    --window-title="Android-Hyprland" &
  disown
else
  notify-send "Phone Link" "Connection failed to $PHONE_IP"
  exit 1
fi
