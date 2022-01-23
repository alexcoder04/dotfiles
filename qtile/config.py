#!/usr/bin/env python3
#        _                        _            ___  _  _   
#   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
#  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
# | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
#  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
# 
# Copyright (c) 2021 alexcoder04 <https://github.com/alexcoder04>
# 
# qtile config
# 

# -----------------------------------------------------------------------------
# IMPORTS
# -----------------------------------------------------------------------------
from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Screen, Match
from libqtile.lazy import lazy
import os
import subprocess

# -----------------------------------------------------------------------------
# HELPER FUNCTIONS
# -----------------------------------------------------------------------------
def getenv(key, default):
    if key in os.environ:
        return os.environ[key]
    return default

# -----------------------------------------------------------------------------
# SETTINGS
# -----------------------------------------------------------------------------
follow_mouse_focus = False
reconfigure_screens = True
wmname = "LG3D"
mod = "mod4"
alt = "mod1"
terminal = getenv("TERMINAL", "alacritty")
theme = {
        "black":     getenv("COLOR_BLACK", "#000000"),
        "blue":      getenv("COLOR_BLUE", "#0000ff"),
        "cyan":      getenv("COLOR_CYAN", "#00ffff"),
        "dark_blue": getenv("COLOR_DARK_BLUE", "#000088"),
        "dark_grey": getenv("COLOR_DARK_GREY", "#222222"),
        "green":     getenv("COLOR_GREEN", "#00ff00"),
        "grey":      getenv("COLOR_GREY", "#555555"),
        "magenta":   getenv("COLOR_MAGENTA", "#ff3333"),
        "purple":    getenv("COLOR_PURPLE", "#ff00ff"),
        "red":       getenv("COLOR_RED", "#ff0000"),
        "white":     getenv("COLOR_WHITE", "#ffffff"),
        "yellow":    getenv("COLOR_YELLOW", "#ffff00"),
        }

# -----------------------------------------------------------------------------
# KEYBINDS AND MOUSE
# -----------------------------------------------------------------------------
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),

    # Move windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Change size of windows
    Key([alt, "control"], "h", lazy.layout.shrink()),
    Key([alt, "control"], "l", lazy.layout.grow()),

    # Navigate between groups
    Key([alt], "h", lazy.screen.prev_group()),
    Key([alt], "l", lazy.screen.next_group()),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "space", lazy.window.toggle_floating()),

    # Close window
    Key([mod], "q", lazy.window.kill()),

    # Session (restart / quit)
    Key([alt, "control"], "r", lazy.restart()),
    Key([alt, "control"], "q", lazy.shutdown()),

    # Fallback terminal
    Key([mod], "F10", lazy.spawn(terminal)),
]

# Drag floating windows
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

# -----------------------------------------------------------------------------
# WORKSPACES AND LAYOUTS
# -----------------------------------------------------------------------------
workspaces = [
        ("  ", "monadtall"),
        ("  ", "max"),
        ("  ", "monadtall"),
        ("  ", "monadtall"),
        (" 1 ", "monadtall"),
        (" 2 ", "monadtall"),
        ("  ", "monadtall"),
        ("  ", "monadtall"),
        ("  ", "monadtall"),
        ("  ", "monadtall"),
        ]

groups = []
for i, (wlabel, wlayout) in enumerate(workspaces):
    group = Group(wlabel, layout=wlayout)
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], str(i), lazy.group[group.name].toscreen()),
        # mod1 + shift + letter of group = move focused window to group
        Key([mod, "shift"], str(i), lazy.window.togroup(group.name)),
        ])
    groups.append(group)

layout_theme = {
    "border_focus": theme["green"],
    "border_normal": theme["dark_grey"],
    "border_width": 2,
    "margin": 5,
    }

floating_layout_theme = layout_theme.copy()
floating_layout_theme["border_focus"] = theme["cyan"]
floating_layout_theme["border_width"] = 3

floating_layout = layout.Floating(
        **floating_layout_theme,
        float_rules=[
            *layout.Floating.default_float_rules,
            Match(title='Confirmation'),
            Match(title='Qalculate!'),
            Match(wm_class='pinentry-gtk-2'),
            Match(wm_class="i3_float"),
            Match(wm_class="Qemu-system-x86_64"),
            Match(wm_class="Pavucontrol"),
            Match(wm_class="TIPP10"),
            Match(wm_class="Gnome-2048"),
            Match(wm_class="Signal"),
            Match(wm_class="Catfish"),
            Match(wm_class="Gpick"),
            Match(wm_class="calculator"),
            Match(wm_class="Cinnamon-settings.py"),
            ]
        )

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Bsp(**layout_theme),
]

# -----------------------------------------------------------------------------
# SCREENS AND BARS
# -----------------------------------------------------------------------------
widget_defaults = dict(
    background=theme["black"],
    border_width=0,
    font="Inconsolata",
    fontsize=16,
    foreground=theme["white"],
    padding=3,
)
extension_defaults = widget_defaults.copy()

def get_active_screens():
    return [
        i for i in subprocess.check_output("xrandr").decode("utf-8").split("\n")
        if " connected " in i and "mm x " in i
        ]

def bar_sep():
    return widget.TextBox(text="|")

def init_bar(systray=False):
    widgets = [
        widget.CurrentLayoutIcon(),
        widget.WindowCount(),
        widget.GroupBox(
            disable_drag=True,
            hide_unused=True,
            this_current_screen_border=theme["green"],
            this_screen_border=theme["cyan"],
            urgent_border=theme["red"]
            ),
        widget.Spacer(),
        widget.CryptoTicker(
            foreground=theme["green"]
            ),
        bar_sep(),
        widget.Net(
            format="{down} ↓↑ {up}",
            update_interval=3
            ),
        widget.NetGraph(
            fill_color=theme["dark_grey"],
            graph_color=theme["green"],
            samples=50,
            frequency=3
            ),
        bar_sep(),
        widget.HDDBusyGraph(
            fmt="{}",
            fill_color=theme["dark_grey"],
            graph_color=theme["blue"],
            device="nvme0n1",
            samples=50,
            frequency=5
            ),
        bar_sep(),
        widget.Memory(
            format="{MemUsed: .0f}{mm}",
            update_interval=5
            ),
        widget.MemoryGraph(
            fill_color=theme["dark_grey"],
            graph_color=theme["purple"],
            samples=50,
            frequency=5
            ),
        bar_sep(),
        widget.CPU(
            format=" {load_percent}%",
            update_interval=2
            ),
        widget.CPUGraph(
            fill_color=theme["dark_grey"],
            graph_color=theme["yellow"],
            frequency=2,
            samples=50
            ),
        widget.ThermalZone(
                zone="/sys/class/thermal/thermal_zone7/temp",
                update_interval=3,
                format="{temp}°C",
                format_crit="HOT:{temp}°C",
                fgcolor_crit=theme["red"],
                fgcolor_high=theme["yellow"]
                ),
        bar_sep(),
        widget.Battery(
            format="{char} {percent:2.0%} ({hour:d}:{min:02d} / {watt:.2f}W)",
            background=theme["black"],
            foreground=theme["green"],
            discharge_char="",
            charge_char="",
            empty_char="",
            full_char="",
            low_foreground=theme["red"],
            low_percentage=0.25,
            unknown_char="🤔"
            ),
        bar_sep(),
        widget.Volume(
                foreground=theme["magenta"],
                fmt=" {}",
                step=5,
                update_interval=0.5
                ),
        bar_sep(),
        widget.Clock(format=" %a, %e.%m - %R:%S"),
        ]
    if systray:
        widgets.append(bar_sep())
        widgets.append(widget.Systray())
    return bar.Bar(widgets, 24)

def default_screen():
    return Screen(top=init_bar(systray=False))

def screen_with_systray():
    return Screen(top=init_bar(systray=True))

def init_screens():
    if qtile is None or qtile.core.name == "x11":
        screens = []
        for i, _ in enumerate(get_active_screens()):
            if i == 0:
                screens.append(screen_with_systray())
                continue
            screens.append(default_screen())
        return screens
    return [default_screen()]

screens = init_screens()

# -----------------------------------------------------------------------------
# MY INIT SCRIPT
# -----------------------------------------------------------------------------
@hook.subscribe.startup_once
def wminit():
    subprocess.call("wm-init")

