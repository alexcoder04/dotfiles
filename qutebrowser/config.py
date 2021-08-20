#!/usr/bin/env python3

import json
import os

XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME")

MY_BLACK = "+COLOR_BLACK+"
MY_DARK_BLUE = "+COLOR_DARK_BLUE+"
MY_LIGHT_BLUE = "+COLOR_CYAN+"
MY_WHITE = "+COLOR_WHITE+"
MY_DARK_GREY = "+COLOR_DARK_GREY+"
MY_GREEN = "+COLOR_GREEN+"
MY_RED = "+COLOR_RED+"
MY_YELLOW = "+COLOR_YELLOW+"

c.qt.args = ["blink-settings=darkMode=1"]
c.colors.tabs.even.bg = MY_DARK_BLUE
c.colors.tabs.even.fg = MY_WHITE
c.colors.tabs.odd.bg = MY_BLACK
c.colors.tabs.odd.fg = MY_WHITE
c.colors.tabs.selected.even.bg = MY_LIGHT_BLUE
c.colors.tabs.selected.even.fg = MY_BLACK
c.colors.tabs.selected.odd.bg = MY_LIGHT_BLUE
c.colors.tabs.selected.odd.fg = MY_BLACK
c.colors.tabs.bar.bg = MY_DARK_GREY
c.colors.completion.item.selected.bg = MY_GREEN
c.colors.completion.item.selected.fg = MY_BLACK
c.colors.completion.match.fg = MY_GREEN
c.colors.completion.even.bg = MY_DARK_GREY
c.colors.completion.odd.bg = MY_BLACK
c.colors.completion.fg = MY_WHITE
c.colors.completion.category.bg = MY_DARK_BLUE
c.colors.completion.category.fg = MY_WHITE
c.colors.statusbar.normal.bg = MY_BLACK
c.colors.statusbar.normal.fg = MY_WHITE
c.colors.statusbar.command.bg = MY_DARK_BLUE
c.colors.statusbar.command.fg = MY_WHITE
c.colors.statusbar.insert.bg = MY_DARK_GREY
c.colors.statusbar.insert.fg = MY_WHITE
c.colors.statusbar.url.error.fg = MY_RED
c.colors.statusbar.url.success.http.fg = MY_LIGHT_BLUE
c.colors.statusbar.url.success.https.fg = MY_LIGHT_BLUE
c.colors.statusbar.url.fg = MY_YELLOW
c.colors.hints.bg = MY_YELLOW
c.colors.hints.fg = MY_BLACK
c.colors.downloads.bar.bg = MY_BLACK
c.colors.downloads.error.bg = MY_RED
c.colors.downloads.error.fg = MY_WHITE
c.colors.downloads.start.bg = MY_DARK_BLUE
c.colors.downloads.start.fg = MY_WHITE
c.colors.downloads.stop.bg = MY_GREEN
c.colors.downloads.stop.fg = MY_BLACK
c.colors.prompts.bg = MY_BLACK
c.colors.prompts.fg = MY_WHITE

c.fonts.default_family = "Inconsolata"
c.fonts.default_size = "15pt"
c.fonts.web.family.standard = "Inconsolata"
c.scrolling.smooth = False

c.tabs.position = "left"
c.tabs.show = "multiple"
c.tabs.favicons.show = "always"
c.tabs.favicons.scale = 0.7
c.tabs.padding = { "top": 5, "bottom": 5, "left": 5, "right": 5 }
c.tabs.title.format = "{audio}{index}"
c.tabs.width = 50

c.url.default_page = "about:blank"
c.url.start_pages = ["about:blank"]
c.url.searchengines = json.load(open(f"{XDG_CONFIG_HOME}/qutebrowser/searchengines.json"))

c.aliases = {
            "tab-new": "open -t"
        }

config.bind("t", "open -t")

