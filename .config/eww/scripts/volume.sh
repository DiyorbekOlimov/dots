#!/usr/bin/zsh

VOLUME="$(pamixer --get-volume)"

MUTE="$(pamixer --get-mute)"

if [[ $MUTE == "true" ]] then
    ICON="婢"
else
    if [[ $VOLUME -gt 66 ]] then
        ICON="󰕾"
    elif [[ $VOLUME -gt 33 ]] then
        ICON="󰖀"
    else
        ICON="󰕿"
    fi
fi



if [[ $1 == "-g" ]] then
    echo "$ICON $VOLUME"
elif [[ $1 == "-c" ]] then
    if [[ $MUTE == "true" ]] then 
        echo "disabled"
    fi
elif [[ $1 == "-t" ]] then
    pamixer -t
    eww update volume="$(~/.config/eww/scripts/volume.sh -g)"
    eww update volume_class="$(~/.config/eww/scripts/volume.sh -c)"
elif [[ $@ == "-s up" ]] then
    pamixer -i 5
    eww update volume="$(~/.config/eww/scripts/volume.sh -g)"
    eww update volume_class="$(~/.config/eww/scripts/volume.sh -c)"
elif [[ $@ == "-s down" ]] then
    pamixer -d 5
    eww update volume="$(~/.config/eww/scripts/volume.sh -g)"
    eww update volume_class="$(~/.config/eww/scripts/volume.sh -c)"
fi
