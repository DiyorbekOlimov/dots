#!/usr/bin/zsh

STATE_FILE="/tmp/eww_bar_tray"

PID="$(pidof stalonetray)"

if [[ $PID ]] then
    if [[ -e $STATE_FILE ]] then
        rm $STATE_FILE
        xdo hide -N stalonetray
        eww update tray_icon="󰅀"
    else
        touch $STATE_FILE
        xdo show -N stalonetray
        eww update tray_icon="󰅃"
    fi
else
    stalonetray &
fi
