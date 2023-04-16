#!/usr/bin/zsh

BATTERY="BAT1"
ADAPTER="ACAD"

CHARGING="$(cat /sys/class/power_supply/$ADAPTER/online)"

PERCENT=$(cat /sys/class/power_supply/$BATTERY/capacity)

if [[ $CHARGING == "1" ]] then
    CLASS="green"
elif [[ $PERCENT -gt 30 ]] then
    CLASS="amber"
else
    CLASS="red"
fi

if [[ $CHARGING == "1" ]] then
    ICON="󰂄"
elif [[ $PERCENT -gt 95 ]] then
    ICON="󰁹"
elif [[ $PERCENT -gt 85 ]] then
    ICON="󰂂"
elif [[ $PERCENT -gt 75 ]] then
    ICON="󰂁"
elif [[ $PERCENT -gt 65 ]] then
    ICON="󰂀"
elif [[ $PERCENT -gt 55 ]] then
    ICON="󰁿"
elif [[ $PERCENT -gt 45 ]] then
    ICON="󰁾"
elif [[ $PERCENT -gt 35 ]] then
    ICON="󰁽"
elif [[ $PERCENT -gt 25 ]] then
    ICON="󰁼"
elif [[ $PERCENT -gt 15 ]] then
    ICON="󰁻"
else
    ICON="󰁺"
fi


if [[ $1 == "-c" ]] then
    echo $CLASS
else
    echo "$ICON $PERCENT%"
fi
