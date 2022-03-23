#!/usr/bin/env python3
#        _                        _            ___  _  _   
#   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
#  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
# | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
#  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
# 
# Copyright (c) 2022 alexcoder04 <https://github.com/alexcoder04>
# 
# generate json theme file for bumblebee-status from reconf env vars

import json
import os

def getenv(key, default):
    if key in os.environ:
        return os.environ[key]
    return default

# get env vars
HOME = getenv("HOME", os.path.expanduser("~"))
XDG_CONFIG_HOME = getenv("XDG_CONFIG_HOME", os.path.join(HOME, ".config"))

# get colors
MY_BLACK = getenv("RECONF_COLOR_BLACK", "#000000")
MY_BLUE = getenv("RECONF_COLOR_BLUE", "#0000ff")
MY_DARK_BLUE = getenv("RECONF_COLOR_DARK_BLUE", "#000088")
MY_LIGHT_BLUE = getenv("RECONF_COLOR_CYAN", "#00ffff")
MY_WHITE = getenv("RECONF_COLOR_WHITE", "#ffffff")
MY_DARK_GREY = getenv("RECONF_COLOR_DARK_GREY", "#555555")
MY_GREEN = getenv("RECONF_COLOR_GREEN", "#00ff00")
MY_RED = getenv("RECONF_COLOR_RED", "#ff0000")
MY_YELLOW = getenv("RECONF_COLOR_YELLOW", "#ffff00")
MY_ORANGE = getenv("RECONF_COLOR_ORANGE", "#ff8800")

theme = {
        "icons": ["awesome-fonts"],
        "defaults": {
            "separator-block-width": -1,
            "warning": { "fg": MY_BLACK, "bg": MY_ORANGE },
            "critical": { "fg": MY_WHITE, "bg": MY_RED }
            },
        "cycle": [
            { "fg": MY_WHITE, "bg": MY_DARK_BLUE },
            { "fg": MY_WHITE, "bg": MY_BLACK }
            ],
        "kernel": { "fg": MY_BLACK, "bg": MY_BLUE },
        "sensors": { "fg": MY_BLACK, "bg": MY_BLUE },
        "nic": { "up": { "fg": MY_BLACK, "bg": MY_GREEN } },
        "diskspace": { "fg": MY_YELLOW },
        "cpu": {
            "bg": MY_YELLOW, "fg": MY_BLACK,
            "warning": { "fg": MY_BLACK, "bg": MY_ORANGE },
            "critical": { "fg": MY_WHITE, "bg": MY_RED }
            },
        "bitcoin": { "fg": MY_GREEN },
        "battery": {
            "charged": { "fg": MY_BLACK, "bg": MY_GREEN },
            "AC": { "fg": MY_BLACK, "bg": MY_GREEN }
            },
        "display": {
            "fg": MY_BLUE
            }
        }

print(json.dumps(theme))

