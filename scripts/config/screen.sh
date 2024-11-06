#!/bin/sh

screen_hdmi=$(xrandr | grep " connected" | grep "HDMI-0")
screen_hdmi_test="HDMI-0"

# 单屏
if [[ $screen_hdmi != *$screen_hdmi_test* ]]; then
    xrandr \                                                                                                                                               ✔  at 02:22:29 
     --dpi 96 \
     --output eDP --mode 2560x1440 --rate 240 --pos 0x0 --primary \
     --output DisplayPort-0 --off \
     --output DisplayPort-1 --off \
     --output DisplayPort-2 --off

    echo "Xft.dpi: 96" | xrdb -merge

# 多屏
else
    xrandr \
     --dpi 108 \
     --output DP-0 --off \
     --output DP-1 --off \
     --output HDMI-0 --mode 2560x1440 --rate 144 --pos 0x0 --primary \
     --output DP-2 --off \
     --output eDP-1-1 --mode 2560x1440 --rate 240 --pos 2560x0 \
     --output DP-1-1 --off \
     --output DP-1-2 --off \
     --output DP-1-3 --off
    
    echo "Xft.dpi: 108" | xrdb -merge
fi
