#! /bin/bash

tempfile=/tmp/statusbar_temp

this=_light
icon_color="^c#3B102B^^b#6873790x88^"
text_color="^c#3B102B^^b#6873790x99^"
signal=$(echo "^s$this^" | sed 's/_//')

update() {
    light_text=$(light -G | awk '{print int($0)}')
    if [ $light_text -eq 0 ];  then light_text="00"; light_icon="󰃞";
    elif [ $light_text -lt 10 ]; then light_icon="󰃟"; light_text=0$light_text;
    elif [ $light_text -le 50 ]; then light_icon="󰃠";
    else light_icon="󰃠"; fi
    icon=" $light_icon "
    text=" $light_text% "

    sed -i '/^export '$this'=.*$/d' $tempfile
    printf "export %s='%s%s%s%s%s'\n" $this "$signal" "$icon_color" "$icon" "$text_color" "$text" >> $tempfile

}


notify() {
    update
    notify-send -r 9527 -h int:value:$light_text -h string:hlcolor:#dddddd "$light_icon Backlight"
}


click() {
    case "$1" in
        L) notify;;
        U) light -A 1; notify;;
        D) light -U 1; notify;;
    esac
}

case "$1" in
    click) click $2 ;;
    notify) notify ;;
    *) update ;;
esac
