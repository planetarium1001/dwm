#!/bin/sh
case $(echo -e '󰤆 关机\n󰦛 重启\n 挂载/卸载移动存储介质\n󱤙 开启/关闭uu加速器\n󰖙 开启/关闭picom\n󰥻 开启/关闭fcitx5' | rofi -dmenu -window-title Setting -show-icons -theme dracula1 -font "JetBrainsMono Nerd Font 18") in
    "󰤆 关机") shutdown now ;;
    "󰦛 重启") reboot ;;
    " 挂载/卸载移动存储介质") ~/.dwm/config/udisk.sh ;;
    "󱤙 开启/关闭uu加速器") ~/.dwm/config/uuplugin.sh ;;
    "󰖙 开启/关闭picom") ~/.dwm/config/picom.sh ;;
    "󰥻 开启/关闭fcitx5") ~/.dwm/config/fcitx5.sh ;;
esac
