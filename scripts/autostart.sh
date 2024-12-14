#! /bin/bash

_thisdir=$(cd $(dirname $0);pwd)

settings() {
    [ $1 ] && sleep $1
    xset -b                                   # 关闭蜂鸣器
    #bash ~/.config/dwm/config/screen.sh      # 设置显示器
    #xlayoutdisplay                           # 设置显示器

}

daemons() {
    [ $1 ] && sleep $1
    $_thisdir/statusbar/statusbar.sh cron &   # 开启状态栏定时更新
    #xss-lock -- ~/.dwm/config/blurlock.sh &  # 开启自动锁屏程序
    #xinput disable 13                        # 禁用触摸板
    nitrogen --restore                        # wallpaper
    #bash ~/.dwm/config/wallpaper.sh
    dunst -conf ~/.config/dwm/config/dunst.conf &    # notice server
    fcitx5 -d                                 # 开启输入法
    flameshot &                               # flameshot
    picom --experimental-backends --config ~/.config/dwm/config/picom.conf >> /dev/null 2>&1 & # 开启picom
    #optimus-manager-qt &                     # optimus-manager显卡管理
    blueman-applet &                          # 蓝牙托盘
    aria2c --conf-path=/home/aurora/.config/aria2/aria2.conf &                          # aria2
    lxqt-policykit-agent &                    # policykit
    #xfce4-power-manager &                    # 电源管理
}

settings 1 &                                  # 初始化设置项
daemons 3 &                                   # 后台程序项
