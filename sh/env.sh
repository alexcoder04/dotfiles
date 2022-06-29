#        _                        _            ___  _  _
#   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |
#  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_
# | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
#  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|
#
# Copyright (c) 2020-2022 alexcoder04 <https://github.com/alexcoder04>
#      
# shell environmental variables

export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES_REPO="+DOTFILES_REPO+"
export SCRIPTS_DIR="+SCRIPTS_DIR+"

# XDG variables {{{
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"
# }}}

# tricks so other programs accept XDG {{{
export ANDROID_HOME="$XDG_DATA_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gpg"
export GOPATH="$XDG_DATA_HOME/go"
export KERAS_HOME="$XDG_SHARE_HOME/keras"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/mbsyncrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PYTHONSTARTUP="$DOTFILES_REPO/misc/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export XRESOURCES="$XDG_CONFIG_HOME/X11/Xresources"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
# }}}

# prefered programs
export BROWSER="+BROWSER_MAIN+"
export EDITOR="+EDITOR_MAIN+"
export PAGER="+PAGER+"
export TERMINAL="launch" # terminal emulator wrapper
export VISUAL="+VISUAL+"

# GTK
export GTK2_RC_FILES="/usr/share/themes/Arc-Dark/gtk-2.0/gtkrc"
export NO_AT_BRIDGE=1

# PATH parts
PERL_PATH="/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
BASE_PATH="/usr/local/bin:/usr/bin:/bin:$PERL_PATH:/usr/lib/jvm/default/bin:/usr/local/sbin:/usr/sbin:/sbin"
PMS_PATH="$CARGO_HOME/bin:$GOPATH/bin"

# finally, PATH
export PATH="$SCRIPTS_DIR:$HOME/.local/Applications:$HOME/.local/bin:$PMS_PATH:$BASE_PATH"

# colors {{{
export COLORSCHEME="+THEME+"

export COLOR_BLACK="+COLOR_BLACK+"
export COLOR_BLUE="+COLOR_BLUE+"
export COLOR_BRIGHT_BLUE="+COLOR_BRIGHT_BLUE+"
export COLOR_BRIGHT_CYAN="+COLOR_BRIGHT_CYAN+"
export COLOR_BRIGHT_GREEN="+COLOR_BRIGHT_GREEN+"
export COLOR_BRIGHT_MAGENTA="+COLOR_BRIGHT_MAGENTA+"
export COLOR_BRIGHT_RED="+COLOR_BRIGHT_RED+"
export COLOR_BRIGHT_YELLOW="+COLOR_BRIGHT_YELLOW+"
export COLOR_CYAN="+COLOR_CYAN+"
export COLOR_DARK_GREY="+COLOR_DARK_GREY+"
export COLOR_GREEN="+COLOR_GREEN+"
export COLOR_LIGHT_GREY="+COLOR_LIGHT_GREY+"
export COLOR_MAGENTA="+COLOR_MAGENTA+"
export COLOR_RED="+COLOR_RED+"
export COLOR_WHITE="+COLOR_WHITE+"
export COLOR_YELLOW="+COLOR_YELLOW+"
# }}}

# different settings
export SECOND_MONITOR_POSITION="+SECOND_MONITOR_POSITION+"
export KEYBOARD_LAYOUT="+KEYBOARD_LAYOUT+"
export VIM_HEAVY_PLUGINS="+VIM_HEAVY_PLUGINS+"
export FONT="+FONT+"
export GOPROXY="direct"
if [ -d "/media/cache/nvim" ]; then
  export NVIMCACHE="/media/cache/nvim"
else
  export NVIMCACHE="$XDG_CACHE_HOME/nvim"
fi

