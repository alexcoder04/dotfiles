#        _                        _            ___  _  _
#   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |
#  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_
# | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
#  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|
#
# Copyright (c) 2020-2021 alexcoder04 <https://github.com/alexcoder04>
#      
# shell environmental variables

export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES_REPO="+DOTFILES_REPO+"
export SCRIPTS_DIR="+SCRIPTS_DIR+"

# XDG variables
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:/home/alex/.local/share/flatpak/exports/share"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# tricks so other programs accept XDG
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gpg"
export GOPATH="$XDG_DATA_HOME/go"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PYTHONSTARTUP="$DOTFILES_REPO/misc/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export XRESOURCES="$XDG_CONFIG_HOME/X11/Xresources"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# prefered programs
export BROWSER="+BROWSER_MAIN+"
export EDITOR="+EDITOR_MAIN+"
export PAGER=+PAGER+
export TERMINAL="+TERMINAL_MAIN+"
export VISUAL="+VISUAL+"

# GTK
export GTK2_RC_FILES=/usr/share/themes/Arc-Dark/gtk-2.0/gtkrc
export NO_AT_BRIDGE=1

# finally, PATH
export PATH="+ENV_PATH+"

# colors
export COLORSCHEME="+COLORSCHEME+"
case "$COLORSCHEME" in
    dracula) export BAT_THEME="Dracula" ;;
    gruvbox) export BAT_THEME="gruvbox-dark" ;;
esac

export COLOR_BLACK="+COLOR_BLACK+"
export COLOR_RED="+COLOR_RED+"
export COLOR_GREEN="+COLOR_GREEN+"
export COLOR_YELLOW="+COLOR_YELLOW+"
export COLOR_BLUE="+COLOR_BLUE+"
export COLOR_PURPLE="+COLOR_PURPLE+"
export COLOR_CYAN="+COLOR_CYAN+"
export COLOR_WHITE="+COLOR_WHITE+"
export COLOR_DARK_GREY="+COLOR_DARK_GREY+"
export COLOR_LIGHT_RED="+COLOR_LIGHT_RED+"
export COLOR_LIGHT_GREEN="+COLOR_LIGHT_GREEN+"
export COLOR_LIGHT_YELLOW="+COLOR_LIGHT_YELLOW+"
export COLOR_LIGHT_BLUE="+COLOR_LIGHT_BLUE+"
export COLOR_LIGHT_PURPLE="+COLOR_LIGHT_PURPLE+"
export COLOR_LIGHT_CYAN="+COLOR_LIGHT_CYAN+"
export COLOR_LIGHT_GREY="+COLOR_LIGHT_GREY+"

export COLOR_MAGENTA="+COLOR_MAGENTA+"
export COLOR_DARK_BLUE="+COLOR_DARK_BLUE+"

# different settings
export SECOND_MONITOR_POSITION="+SECOND_MONITOR_POSITION+"
export KEYBOARD_LAYOUT="+KEYBOARD_LAYOUT+"
export VIM_HEAVY_PLUGINS="+VIM_HEAVY_PLUGINS+"
if [ -d "/media/cache/nvim" ]; then
  export NVIMCACHE="/media/cache/nvim"
else
  export NVIMCACHE="$XDG_CACHE_HOME/nvim"
fi

