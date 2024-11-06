#!/bin/sh

screen_hdmi=$(xrandr | grep " connected" | grep "HDMI-0")
screen_hdmi_test="HDMI-0"
video_0=/home/aoharu/Pictures/Wallpapers/白子骑行.mp4
video_1=/home/aoharu/Pictures/Wallpapers/白子骑行.mp4
video_2=/home/aoharu/Pictures/Wallpapers/黑子.mp4

# 单屏
if [[ $screen_hdmi != *$screen_hdmi_test* ]]; then
    xwinwrap -g 2560x1440+0+0 -un -fdt -ni -b -nf -ov -- mpv --no-audio --no-osc --no-border --no-window-dragging --no-input-default-bindings --no-osd-bar --no-stop-screensaver --no-sub --loop -wid WID "$video_0" >>/dev/null 2>&1 &
# 多屏
else
    xwinwrap -g 2560x1440+0+0 -un -fdt -ni -b -nf -ov -- mpv --no-audio --no-osc --no-border --no-window-dragging --no-input-default-bindings --no-osd-bar --no-stop-screensaver --no-sub --loop -wid WID "$video_1" >>/dev/null 2>&1 &
    xwinwrap -g 2560x1440+2560+0 -un -fdt -ni -b -nf -ov -- mpv --no-audio --no-osc --no-border --no-window-dragging --no-input-default-bindings --no-osd-bar --no-stop-screensaver --no-sub --loop -wid WID "$video_2" >>/dev/null 2>&1 &
fi
