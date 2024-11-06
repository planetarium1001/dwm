#!/usr/bin/zsh

device_info=$(udiskie-info -a -o "{device_file} {ui_label}" | rofi -dmenu -window-title Mount/Umount -theme dracula1 -font "JetBrainsMono Nerd Font 18")
device=$(echo $device_info | cut -d' ' -f1)
device_name=$(echo $device_info | cut -d' ' -f3)

if [ -n "$device" ] ; then

    if mount | grep "$device" ; then
        udisksctl unmount -b ${device}
        notify-send -r 9527 -h string:hlcolor:#dddddd " Umounted" "\n$device:$device_name"
    else
        udisksctl mount -b ${device}
        notify-send -r 9527 -h string:hlcolor:#dddddd " Mount" "\n$device:$device_name"
    fi
        
fi
