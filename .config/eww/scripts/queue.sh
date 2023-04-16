#!/usr/bin/zsh

GROUP="$(pueue group | grep eww)"

if [[ $GROUP == "" ]] then
    pueue group add eww
fi


if [[ $1 == "dashboard" ]] then
    if [[ $2 == "keep" ]] then
        DASHBOARD_ID="$(cat /tmp/eww-dashboard-queue)"
        pueue remove $DASHBOARD_ID
    elif [[ $2 == "lost" ]] then
        DASHBOARD_ID="$(pueue add --delay=1 --group eww --print-task-id -- eww close dashboard)"
        echo $DASHBOARD_ID > /tmp/eww-dashboard-queue
    elif [[ $2 == "new" ]] then
        eww open dashboard
        DASHBOARD_ID="$(pueue add --delay=5 --group eww --print-task-id -- eww close dashboard)"
        echo $DASHBOARD_ID > /tmp/eww-dashboard-queue
    fi
elif [[ $1 == "notification" ]] then
    if [[ $2 == "keep" ]] then
        NOTIFICATION_ID="$(cat /tmp/eww-notification-queue)"
        pueue remove $NOTIFICATION_ID
    elif [[ $2 == "lost" ]] then
        NOTIFICATION_ID="$(pueue add --delay=1 --group eww --print-task-id -- eww close notification_popup)"
        echo $NOTIFICATION_ID > /tmp/eww-notification-queue
    elif [[ $2 == "new" ]] then
        eww open notification_popup
        NOTIFICATION_ID="$(pueue add --delay=5 --group eww --print-task-id -- eww close notification_popup)"
        echo $NOTIFICATION_ID > /tmp/eww-notification-queue
    fi
fi
