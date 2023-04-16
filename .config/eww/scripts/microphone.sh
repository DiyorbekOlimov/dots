#!/usr/bin/zsh

SOURCE="alsa_input.pci-0000_00_1f.3.analog-stereo"

VOLUME="$(pamixer --source $SOURCE --get-volume)"

MUTE="$(pamixer --source $SOURCE --get-mute)"

if [[ $MUTE == "true" ]] then
    ICON="󰍭"
else
    ICON="󰍬"
fi



if [[ $1 == "-g" ]] then
    echo "$ICON $VOLUME"
elif [[ $1 == "-c" ]] then
    if [[ $MUTE == "true" ]] then 
        echo "disabled"
    fi
elif [[ $1 == "-t" ]] then
    pamixer --source $SOURCE -t
    eww update microphone="$(~/.config/eww/scripts/microphone.sh -g)"
    eww update microphone_class="$(~/.config/eww/scripts/microphone.sh -c)"
elif [[ $@ == "-s up" ]] then
    pamixer --source $SOURCE -i 5
    eww update microphone="$(~/.config/eww/scripts/microphone.sh -g)"
    eww update microphone_class="$(~/.config/eww/scripts/microphone.sh -c)"
elif [[ $@ == "-s down" ]] then
    pamixer --source $SOURCE -d 5
    eww update microphone="$(~/.config/eww/scripts/microphone.sh -g)"
    eww update microphone_class="$(~/.config/eww/scripts/microphone.sh -c)"
fi
