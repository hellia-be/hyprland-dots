#!/bin/bash

# This script uses Fuzzel in dmenu mode to present a power menu and execute the selected action.

# Define the menu options as a multi-line string.
# Each option is a separate line.
MENU_OPTIONS="Lock
Logout
Suspend
Shutdown
Reboot"

# Pipe the options to Fuzzel and capture the user's choice.
# --dmenu enables dmenu mode, and --prompt customizes the prompt text.
SELECTION=$(echo -e "${MENU_OPTIONS}" | fuzzel --dmenu --prompt="Power Menu:")

# Use a case statement to perform the selected action.
case "$SELECTION" in
"Lock")
  swaylock --color 000000 --inside-color 000000 --ring-color d9d9d9 --line-color 000000 --key-hl-color d9d9d9 --bs-hl-color d9d9d9 --separator-color 000000 --text-color d9d9d9 --inside-clear-color 000000 --ring-clear-color d9d9d9 --line-clear-color 000000 --key-hl-color d9d9d9 --bs-hl-color d9d9d9 --separator-color 000000 --text-clear-color d9d9d9 --ring-ver-color d9d9d9 --inside-ver-color 000000 --line-ver-color 000000 --text-ver-color d9d9d9 --ring-wrong-color ff0000 --inside-wrong-color 000000 --line-wrong-color 000000 --text-wrong-color d9d9d9 --ignore-empty-password
  ;;
"Logout")
  hyprctl dispatch exit 0
  ;;
"Suspend")
  swaylock --color 000000 --inside-color 000000 --ring-color d9d9d9 --line-color 000000 --key-hl-color d9d9d9 --bs-hl-color d9d9d9 --separator-color 000000 --text-color d9d9d9 --inside-clear-color 000000 --ring-clear-color d9d9d9 --line-clear-color 000000 --key-hl-color d9d9d9 --bs-hl-color d9d9d9 --separator-color 000000 --text-clear-color d9d9d9 --ring-ver-color d9d9d9 --inside-ver-color 000000 --line-ver-color 000000 --text-ver-color d9d9d9 --ring-wrong-color ff0000 --inside-wrong-color 000000 --line-wrong-color 000000 --text-wrong-color d9d9d9 --ignore-empty-password &
  disown && systemctl suspend
  ;;
"Shutdown")
  systemctl poweroff
  ;;
"Reboot")
  systemctl reboot
  ;;
*)
  # Do nothing if the user cancels the menu
  exit 0
  ;;
esac
