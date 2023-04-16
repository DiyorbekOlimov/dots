#!/usr/bin/env python3

import os
import json

focused = os.popen('bspc query -T -d focused')
focused = json.load(focused)

workspaces = []

for ws_num in range(1, 11):
    workspace = os.popen(f'bspc query -T -d {ws_num}')
    workspace = json.load(workspace)

    ws = {}

    ws['name'] = workspace['name']
    ws['class'] = 'occupied ' if workspace['root'] is not None else ''
    ws['class'] += 'focused' if focused['name'] == workspace['name'] else ''

    workspaces.append(ws)


print(json.dumps(workspaces))
