#!/bin/bash

if [ -z "$@" ]; then
    echo -en "Shutdown\0icon\x1fsystem-shutdown\n"
    echo -en "Reboot\0icon\x1fsystem-reboot\n"
    echo -en "Suspend\0icon\x1fsystem-suspend\n"
    echo -en "Logout\0icon\x1fsystem-log-out\n"
else
    if [ "$1" = "Shutdown" ]; then
        systemctl poweroff
    elif [ "$1" = "Reboot" ]; then
        systemctl reboot
    elif [ "$1" = "Suspend" ]; then
        systemctl suspend
    elif [ "$1" = "Logout" ]; then
        bspc quit
    fi
fi
