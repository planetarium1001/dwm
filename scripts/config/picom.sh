#!/usr/bin/zsh

SERVICE_NAME="picom"

if pgrep -x "$SERVICE_NAME" > /dev/null; then
    killall  picom
else
    picom --experimental-backends --config ~/.dwm/config/picom.conf >> /dev/null 2>&1
fi
