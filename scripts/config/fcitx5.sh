#!/usr/bin/zsh

SERVICE_NAME="fcitx5"

if pgrep -x "$SERVICE_NAME" > /dev/null; then
    kill $(pidof fcitx5)
else
    fcitx5 -d
fi
