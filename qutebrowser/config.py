#!/usr/bin/env python3
#        _                        _            ___  _  _
#   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |
#  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_
# | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
#  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|
#
# Copyright (c) 2021 alexcoder04 <https://github.com/alexcoder04>
# 
# qutebrowser config

import os

# get env vars
HOME = os.getenv("HOME")
XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME")

# define colors
MY_BLACK = os.getenv("COLOR_BLACK")
MY_DARK_BLUE = os.getenv("COLOR_DARK_BLUE")
MY_LIGHT_BLUE = os.getenv("COLOR_CYAN")
MY_WHITE = os.getenv("COLOR_WHITE")
MY_DARK_GREY = os.getenv("COLOR_DARK_GREY")
MY_GREEN = os.getenv("COLOR_GREEN")
MY_RED = os.getenv("COLOR_RED")
MY_YELLOW = os.getenv("COLOR_YELLOW")

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
c.fonts.default_family = "Inconsolata"
c.fonts.default_size = "15pt"
c.fonts.web.family.standard = "Inconsolata"

# how to show tabs
c.tabs.favicons.scale = 0.7
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
c.downloads.location.directory = f"{HOME}/Temp"
c.downloads.remove_finished = 1000

# keybindings
config.bind("t", "open -t")
config.bind("Y", "yank selection")
config.load_autoconfig()

# other settings
c.qt.args = ["blink-settings=darkMode=1"]
c.scrolling.smooth = False

