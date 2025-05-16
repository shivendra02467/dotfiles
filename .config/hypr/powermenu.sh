#!/bin/bash

if pgrep -x "wofi" > /dev/null; then
    pkill -x wofi
    exit
fi

CHOICE=$(printf "Shutdown\nReboot\nLogout" | wofi --dmenu --width 400 --height 250 --prompt "Power Menu")

case "$CHOICE" in
  "Shutdown") systemctl poweroff ;;
  "Reboot") systemctl reboot ;;
  "Logout") hyprctl dispatch exit ;;
esac

