#!/usr/bin/env python3
#        _                        _            ___  _  _
#   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |
#  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_
# | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
#  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|
#
# Copyright (c) 2021-2022 alexcoder04 <https://github.com/alexcoder04>
# 
# qutebrowser config
# TODO resource-saving settings on second laptop

import os
import random
import subprocess

def getenv(key, default):
    if key in os.environ:
        return os.environ[key]
    return default

# get env vars
HOME = getenv("HOME", os.path.expanduser("~"))
XDG_CONFIG_HOME = getenv("XDG_CONFIG_HOME", os.path.join(HOME, ".config"))

# define colors
MY_BLACK = getenv("COLOR_BLACK", "#000000")
MY_DARK_BLUE = getenv("COLOR_DARK_BLUE", "#000088")
MY_LIGHT_BLUE = getenv("COLOR_CYAN", "#00ffff")
MY_WHITE = getenv("COLOR_WHITE", "#ffffff")
MY_DARK_GREY = getenv("COLOR_DARK_GREY", "#555555")
MY_GREEN = getenv("COLOR_GREEN", "#00ff00")
MY_RED = getenv("COLOR_RED", "#ff0000")
MY_YELLOW = getenv("COLOR_YELLOW", "#ffff00")

# smaller font size on smaller screens
def get_font_size():
    if getenv("XDG_SESSION_TYPE", "x11") == "wayland":
        return "15pt"
    # all active screens with xrandr
    active_screens = [
        i for i in subprocess.check_output("xrandr").decode("utf-8").split("\n")
        if " connected " in i and "mm x " in i
        ]
    for i in active_screens:
        x, _, _ = i.split()[-3:]
        # small if one of the screens smaller than 250mm tall
        if int(x.replace("mm", "")) < 250:
            return "9pt"
    return "15pt"

# actually just set colors (alphabetically)
c.colors.completion.category.bg = MY_DARK_BLUE
c.colors.completion.category.fg = MY_WHITE
c.colors.completion.even.bg = MY_DARK_GREY
c.colors.completion.fg = MY_WHITE
c.colors.completion.item.selected.bg = MY_GREEN
c.colors.completion.item.selected.fg = MY_BLACK
c.colors.completion.match.fg = MY_GREEN
c.colors.completion.odd.bg = MY_BLACK
c.colors.downloads.bar.bg = MY_BLACK
c.colors.downloads.error.bg = MY_RED
c.colors.downloads.error.fg = MY_WHITE
c.colors.downloads.start.bg = MY_DARK_BLUE
c.colors.downloads.start.fg = MY_WHITE
c.colors.downloads.stop.bg = MY_GREEN
c.colors.downloads.stop.fg = MY_BLACK
c.colors.hints.bg = MY_YELLOW
c.colors.hints.fg = MY_BLACK
c.colors.prompts.bg = MY_BLACK
c.colors.prompts.fg = MY_WHITE
c.colors.statusbar.command.bg = MY_DARK_BLUE
c.colors.statusbar.command.fg = MY_WHITE
c.colors.statusbar.insert.bg = MY_DARK_GREY
c.colors.statusbar.insert.fg = MY_WHITE
c.colors.statusbar.normal.bg = MY_BLACK
c.colors.statusbar.normal.fg = MY_WHITE
c.colors.statusbar.url.error.fg = MY_RED
c.colors.statusbar.url.fg = MY_YELLOW
c.colors.statusbar.url.success.http.fg = MY_LIGHT_BLUE
c.colors.statusbar.url.success.https.fg = MY_LIGHT_BLUE
c.colors.tabs.bar.bg = MY_DARK_GREY
c.colors.tabs.even.bg = MY_DARK_BLUE
c.colors.tabs.even.fg = MY_WHITE
c.colors.tabs.odd.bg = MY_BLACK
c.colors.tabs.odd.fg = MY_WHITE
c.colors.tabs.selected.even.bg = MY_GREEN
c.colors.tabs.selected.even.fg = MY_BLACK
c.colors.tabs.selected.odd.bg = MY_GREEN
c.colors.tabs.selected.odd.fg = MY_BLACK

# fonts
c.fonts.default_family = getenv("FONT", "Inconsolata")
c.fonts.default_size = get_font_size()
c.fonts.web.family.standard = "Inconsolata"

# how to show tabs
c.tabs.favicons.scale = 0.8
c.tabs.favicons.show = "always"
c.tabs.padding = { "top": 5, "bottom": 5, "left": 5, "right": 5 }
c.tabs.position = "left"
c.tabs.show = "multiple"
c.tabs.title.format = "{audio}{index}"
c.tabs.width = 50

# pages and search engines
c.url.default_page = "about:blank"
c.url.start_pages = ["about:blank"]
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "sp": "https://startpage.com/sp/search?q={}",
    "ggl": "https://google.com/search?q={}",
    "wa": "https://wiki.archlinux.org/index.php?search={}",
    "wu": "https://duckduckgo.com/?q=site:wiki.ubuntuusers.de+{}",
    "so": "https://stackoverflow.com/search?q={}",
    "wie": "https://en.wikipedia.org/w/index.php?search={}",
    "wid": "https://de.wikipedia.org/w/index.php?search={}",
    "yt": "https://youtube.com/results?search_query={}"
    }

# downloads
c.downloads.remove_finished = 1000
for folder in [f"{HOME}/Temp", f"{HOME}/Downloads", HOME]:
    if os.path.isdir(folder):
        c.downloads.location.directory = folder
        break

# keybindings
config.bind("t", "open -t")
config.bind("Y", "yank selection")
config.load_autoconfig()

# some privacy options
# user agents list from https://github.com/Kikobeats/top-user-agents, MIT license
user_agents = [
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36",
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15",
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15",
  "Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:96.0) Gecko/20100101 Firefox/96.0",
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 YaBrowser/22.1.0.2517 Yowser/2.5 Safari/537.36",
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0",
  "Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101 Firefox/95.0",
  "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36",
  "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36",
  "Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0",
]
c.content.headers.user_agent = user_agents[random.randint(0, len(user_agents) - 1)]
c.content.blocking.method = "both"
c.content.cookies.accept = "no-unknown-3rdparty"
c.content.geolocation = False

# other settings
c.completion.delay = 50
c.content.pdfjs = True
c.input.partial_timeout = 2000
c.qt.args = ["--blink-settings=darkMode=1"]
c.scrolling.smooth = False

