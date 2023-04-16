#!/usr/bin/zsh

WIFI="$(nmcli -t -f DEVICE,NAME c s -a | rg wlo1 | cut -d: -f 2-)"

if [[ $WIFI == "" ]] then
    echo "󰖪 "
else
    echo "󰖩 $WIFI"
fi
