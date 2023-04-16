#!/bin/env python
import json
import os
import sys
from uuid import uuid4

CACHE_FILE = "/tmp/notifications.json"

IGNORE = ["Music Player Daemon"]

HOME = "/home/diyorbek"


def _get_notifications():
    if os.path.exists(CACHE_FILE):
        with open(CACHE_FILE) as f:
            notifications_raw = f.read()

        if notifications_raw == "":
            notifications_raw = "[]"

        notifications: list[dict] = json.loads(notifications_raw)

    else:
        notifications = []

    return notifications


def _set_notifications(notifications: list[dict]):
    notifications_raw = json.dumps(notifications)
    with open(CACHE_FILE, "w") as f:
        f.write(notifications_raw)

    os.system(f"eww update notifications_='{notifications_raw}'")

    _eww_windows = os.popen("eww windows").read()

    if "*dashboard" not in _eww_windows:
        os.system(f"{HOME}/.config/eww/scripts/queue.sh notification new")


def _add_notification(notification: dict):
    if notification["app"] in IGNORE:
        return

    notifications = _get_notifications()
    notifications.insert(0, notification)
    _set_notifications(notifications)


def clear():
    with open(CACHE_FILE, "w") as f:
        f.write("[]")


def dunst():
    NOTIFICATION = {
        "app": os.environ.get("DUNST_APP_NAME"),
        "summary": os.environ.get("DUNST_SUMMARY"),
        "body": os.environ.get("DUNST_BODY"),
        "icon": os.environ.get("DUNST_ICON_PATH"),
        "urgency": os.environ.get("DUNST_URGENCY"),
        "uuid": str(uuid4()),
    }

    _add_notification(NOTIFICATION)


def close():
    uuid = sys.argv[2]
    notifications = _get_notifications()

    for i in range(len(notifications)):
        if notifications[i]["uuid"] == uuid:
            notifications.pop(i)
            break

    _set_notifications(notifications)


if len(sys.argv) == 1:
    print("provide subcommand")
    exit()


match sys.argv[1]:
    case "clear":
        clear()

    case "close":
        close()

    case _:
        dunst()
