#! /bin/bash
# VOL 音量脚本
# 本脚本需要你自行修改音量获取命令
# 例如我使用的是 pipewire
#
# $ pactl list sinks | grep RUNNING -A 8
#         State: RUNNING
#         Name: bluez_output.88_C9_E8_14_2A_72.1
#         Description: WH-1000XM4
#         Driver: PipeWire
#         Sample Specification: float32le 2ch 48000Hz
#         Channel Map: front-left,front-right
#         Owner Module: 4294967295
# 静音 -> Mute: no                                                                                 
# 音量 -> Volume: front-left: 13183 /  20% / -41.79 dB,   front-right: 13183 /  20% / -41.79 dB
#
# $ pamixer --get-volume
# 15

#tempfile=$(cd $(dirname $0);cd ..;pwd)/temp
tempfile=/tmp/statusbar_temp

this=_vol
icon_color="^c#442266^^b#7879560x88^"
text_color="^c#442266^^b#7879560x99^"
signal=$(echo "^s$this^" | sed 's/_//')

update() {
    vol_text=$(pamixer --get-volume)
    if [ $vol_text -eq 0 ];  then vol_text="00"; vol_icon="婢";
    elif [ $vol_text -lt 10 ]; then vol_icon="奔"; vol_text=0$vol_text;
    elif [ $vol_text -le 50 ]; then vol_icon="奔";
    else vol_icon="墳"; fi

    icon=" $vol_icon "
    text=" $vol_text% "

    sed -i '/^export '$this'=.*$/d' $tempfile
    printf "export %s='%s%s%s%s%s'\n" $this "$signal" "$icon_color" "$icon" "$text_color" "$text" >> $tempfile
}

notify() {
    update
    notify-send -r 9527 -h int:value:$vol_text -h string:hlcolor:#dddddd "$vol_icon Volume"
}

click() {
    case "$1" in
        L) notify                                           ;; # 仅通知
        M) pamixer -m                                       ;; # 切换静音
        R) killall pavucontrol || pavucontrol & ;; # 打开pavucontrol
        U) pamixer -i 1; notify;; # 音量加
        D) pamixer -d 1; notify;; # 音量减
    esac
}

case "$1" in
    click) click $2 ;;
    notify) notify ;;
    *) update ;;
esac
