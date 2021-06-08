#!/usr/bin/fish
#        _                        _            ___  _  _
#   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |
#  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_
# | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
#  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|
#
# Copyright (c) 2020-2021 alexcoder04 <https://github.com/alexcoder04>
#      
# fish config

# ---------------------------------------------------------
# PATH AND OTHER VARIABLES
# ---------------------------------------------------------

set -gx PATH +FISH_PATH+
# XDG variables
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_DATA_DIRS /usr/local/share:/usr/share:/var/lib/flatpak/exports/share:/home/alex/.local/share/flatpak/exports/share
set -gx XDG_CONFIG_DIRS /etc/xdg
# tricks so other programs accept XDG
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -gx _JAVA_OPTIONS "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
set -gx NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx NVM_DIR $XDG_DATA_HOME/nvm
set -gx GOPATH $XDG_DATA_HOME/go
# prefered programs
set -gx TERMINAL	+TERMINAL_MAIN+
set -gx EDITOR		+EDITOR_MAIN+
set browser_main	+BROWSER_MAIN+
set browser_alternative	+BROWSER_SECONDARY+

# ---------------------------------------------------------
# CHECK IF RUNNING IN INTERACTIVE MODE
# ---------------------------------------------------------
if not status --is-interactive
    exit
end

# ---------------------------------------------------------
# ALIASES
# ---------------------------------------------------------

##### CD's
abbr gcd "cd $HOME/CODE/PROJECTS/"
abbr gdot "cd $HOME/CODE/df-new/"
abbr gtmp "cd $HOME/tmp/"
abbr gsch "cd $HOME/SCHULE/"

##### APT commands
abbr sagi "sudo apt install"
abbr sau "sudo apt update"
abbr saup "sudo apt upgrade"
abbr apts "apt search"
abbr alu "apt list --upgradeable"

##### Git commands
abbr gstatus "git status"
abbr gpush "git push && [ -f .autopush ] && ./.autopush || echo 'No autopush script is configured for this repository'"
abbr gpull "git pull"
abbr gcommit "git commit -m"
abbr gclone "git clone"
abbr ginit "git init && cp -v $HOME/Vorlagen/gitignore .gitignore"
abbr gadd "git add"
abbr gaddall "git add all"
abbr gcheckout "git checkout"
abbr gbranch "git branch"

##### System / Terminal commands
alias cls="clear"

alias ls="exa -hl --group-directories-first"
alias la="exa -ahl --group-directories-first"

abbr rm "rm -iv"
abbr rmd "rm -ivr"
abbr mv "mv -iv"
abbr mvd "mv -ivr"
abbr cp "cp -iv"
abbr cpd "cp -ivr"

abbr c+x "chmod +x"

alias :q="exit"
abbr Exit "disown %1 && exit"

abbr v "nvim"
abbr vim "nvim"

##### Fun commands
abbr gnuhead "cat /home/alex/.local/share/gnu-head-xterm"

##### Translator
abbr de:en "trans -shell de:en"
abbr en:de "trans -shell en:de"

# ---------------------------------------------------------
# FUNCTIONS
# ---------------------------------------------------------

###### configs
function conf
	switch $argv
		case i3
			$EDITOR $HOME/CODE/df-new/i3-base/config
		case fish
			$EDITOR $HOME/CODE/df-new/fish/dynamic/config.fish
		case bash
			$EDITOR $HOME/CODE/df-new/bash/bashrc
		case vim
			$EDITOR $HOME/CODE/df-new/vim/init.vim
		case sxhkd
			$EDITOR $HOME/CODE/df-new/wm-utils/sxhkdrc
	end
end

# manage some data I want to store quickly
function get_data
	cat .local/share/some_data | grep $argv
end
function save_data
	read -P "what do you want to save: " value
	echo "$argv: $value" >> .local/share/some_data
end

# show the ascii table
function ascii_table
	curl "http://www.asciitable.com/index/asciifull.gif" > /tmp/.ascii.gif
	feh /tmp/.ascii.gif &
end

# ---------------------------------------------------------
# AUTOSTART
# ---------------------------------------------------------
# Choose what you want to see
# ---------------------------------------------------------

# 1) Simple system information
#pfetch

# 2) More system information
#neofetch

# 3) Random color script
random-color-script

# 4) Nice greeting
#set_color green
#echo "Nice to see you in the Terminal again, Alex =)"
#set_color normal

# ---------------------------------------------------------
# STARSHIP PROMPT
# ---------------------------------------------------------
starship init fish | source

