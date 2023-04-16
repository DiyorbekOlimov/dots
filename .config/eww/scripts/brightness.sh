#!/usr/bin/zsh

PERCENT="$(brightnessctl -m | cut -d, -f4 | tr -d %)"

if [[ $PERCENT -ge 75 ]] then
    ICON="󰃠"
elif [[ $PERCENT -ge 50 ]] then
    ICON="󰃟"
elif [[ $PERCENT -ge 25 ]] then
    ICON="󰃞"
else
    ICON="󰃝"
fi


if [[ $1 == "-g" ]] then
    echo "$ICON $PERCENT%"
elif [[ $1 == "-d" ]] then
    xset dpms force off
elif [[ $@ == "-s up" ]] then
    brightnessctl s 5%+ > /dev/null
    eww update brightness_current="$(~/.config/eww/scripts/brightness.sh -g)"
elif [[ $@ == "-s down" ]] then
    brightnessctl s 5%- > /dev/null
    eww update brightness_current="$(~/.config/eww/scripts/brightness.sh -g)"
fi
