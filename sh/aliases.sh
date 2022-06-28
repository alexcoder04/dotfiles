#        _                        _            ___  _  _
#   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |
#  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_
# | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
#  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|
#
# Copyright (c) 2021-2022 alexcoder04 <https://github.com/alexcoder04>
#      
# shell aliases template

# --------------------------------------------------------------------
# APT COMMANDS
# --------------------------------------------------------------------
ABBREVIATION sagi="sudo apt install"
ABBREVIATION sau="sudo apt update"
ABBREVIATION saup="sudo apt upgrade"
ABBREVIATION apts="apt search"
ABBREVIATION alu="apt list --upgradeable"

# --------------------------------------------------------------------
# GIT COMMANDS
# --------------------------------------------------------------------
ABBREVIATION gad="git add"
ABBREVIATION gada="git add -A"
ABBREVIATION gbr="git branch"
ABBREVIATION gco="git checkout"
ABBREVIATION gcln="git clone"
ABBREVIATION gcom="git commit -S -m"
ABBREVIATION gdf="git diff"
ABBREVIATION gdfs="git diff --staged"
ABBREVIATION gft="git fetch --all"
ABBREVIATION gin="git init"
ABBREVIATION gps="git push"
ABBREVIATION gpl="git pull --rebase"
ABBREVIATION grs="git restore"
ABBREVIATION grau="git remote set-url --add --push origin"
ABBREVIATION gst="git status"

# --------------------------------------------------------------------
# BASIC BASIC TERMINAL COMMANDS
# --------------------------------------------------------------------
# the only thing DOS is superior in: it has a shorter clear command
alias cls='[ "$(seq 1 3 | shuf -n 1)" = "1" ] && timeout 0.5 cmatrix -u 1 -C cyan; clear'

# make ls look nice but still tty-friendly and consider exa not beeing installed
if command -v exa >/dev/null; then
  case "$(tty)" in
    /dev/tty*)
      alias ls="exa -hl --group-directories-first"; alias ll=ls
      alias la="exa -ahl --group-directories-first" ;;
    *)
      alias ls="exa -hl --icons --group-directories-first"; alias ll=ls
      alias la="exa -ahl --icons --group-directories-first" ;;
  esac
  alias tree="exa -T -L 3"
else
  alias ls="ls -lFh --color=auto --group-directories-first"; alias ll=ls
  alias la="ls -AlF --color=auto --group-directories-first"
fi

# rm, cp, mv, ln
ABBREVIATION cp="cp -iv"
ABBREVIATION cpd="cp -ifvr"
ABBREVIATION ln="ln -vs"
ABBREVIATION mv="mv -iv"
ABBREVIATION rm="rm -iv"
ABBREVIATION rmd="rm -Ifvr"

# grep and diff colors
GLOBAL_ALIAS grep="grep --color=auto"
GLOBAL_ALIAS egrep="egrep --color=auto"
GLOBAL_ALIAS fgrep="fgrep --color=auto"
alias diff="diff --color=auto"

# how to exit the shell
alias :q="exit"
case "$0" in
  *zsh) alias Exit="disown && exit" ;;
  *bash) alias Exit="disown -a && exit" ;;
esac

# --------------------------------------------------------------------
# REBIND SOME STUFF
# --------------------------------------------------------------------
# everything is neovim
GLOBAL_ALIAS v="nvim"
GLOBAL_ALIAS vi="nvim"
GLOBAL_ALIAS vim="nvim"
GLOBAL_ALIAS vimdiff="nvim -d"

# my options
GLOBAL_ALIAS cal="cal -m"
GLOBAL_ALIAS sizeof="du --max-depth 0 -h"
GLOBAL_ALIAS wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias bat="nvimpager -c"
alias df="df -h"
alias duf="duf -theme ansi -hide-fs devtmpfs -hide-mp /sys/fs/cgroup --avail-threshold=1G,512M --usage-threshold=0.75,0.9"
alias ffmpeg="ffmpeg -hide_banner"
alias free="free -m"
alias irssi="irssi --config=\"$XDG_CONFIG_HOME/irssi/config\" --home=\"$XDG_DATA_HOME/irssi\""
alias lsblk="lsblk -f"
alias nneomutt="mbsync -a && neomutt"

# handy stuff
ABBREVIATION chx="chmod +x"
ABBREVIATION lastmounts="tail /proc/mounts"
ABBREVIATION webserver="python3 -m http.server 1234"
GLOBAL_ALIAS p="pacman"
GLOBAL_ALIAS py="python3"
GLOBAL_ALIAS sudo="doas"
alias newsboat="newsboat-selector"

# lf wrapper
command -v lf_run >/dev/null && alias lf="lf_run"

# Working with disks
ABBREVIATION umount-luks="sudo umount /media/drive && sudo cryptsetup close drive"
ABBREVIATION driveoff="sudo hdparm -Y"

# sx starts up Xorg, so sw starts up Wayland (Sway) xD
alias sw="sway"
alias sq="WINDOW_MANAGER='qtile start' sx"

# translator
ABBREVIATION de:en="trans -shell de:en"
ABBREVIATION en:de="trans -shell en:de"

