#!/usr/bin/zsh
#        _                        _            ___  _  _
#   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |
#  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_
# | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
#  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|
#
# Copyright (c) 2021 alexcoder04 <https://github.com/alexcoder04>
#      
# zsh aliases

##### CD's
abbrev-alias gcd="cd $HOME/CODE/PROJECTS/ && exa --icons"
abbrev-alias gdot="cd $DOTFILES_REPO/ && exa --icons"
abbrev-alias gtmp="cd $HOME/tmp/ && exa --icons"
abbrev-alias gsch="cd $HOME/SCHULE/ && exa --icons"
abbrev-alias gki="cd $HOME/CODE/PROJECTS/BWKI && exa --icons"
abbrev-alias gbin="cd $HOME/bin && exa --icons"

##### APT commands
abbrev-alias sagi="sudo apt install"
abbrev-alias sau="sudo apt update"
abbrev-alias saup="sudo apt upgrade"
abbrev-alias apts="apt search"
abbrev-alias alu="apt list --upgradeable"

##### Git commands
abbrev-alias gst="git status"
abbrev-alias gpush="git push && [ -f .autopush ] && ./.autopush || echo 'No autopush script is configured for this repository'"
abbrev-alias gpull="git pull"
abbrev-alias gcom="git commit -m"
abbrev-alias gclone="git clone"
abbrev-alias ginit="git init && cp -v $HOME/Vorlagen/gitignore .gitignore"
abbrev-alias gadd="git add"
abbrev-alias gaddall="git add -A"
abbrev-alias gcheckout="git checkout"
abbrev-alias gbranch="git branch"

##### System / Terminal commands
alias cls="clear"

alias ls="exa -hl --icons --group-directories-first"
alias la="exa -ahl --icons --group-directories-first"

abbrev-alias rm="rm -iv"
abbrev-alias rmd="rm -fvr"
abbrev-alias mv="mv -iv"
abbrev-alias cp="cp -iv"
abbrev-alias cpd="cp -fvr"

abbrev-alias chx="chmod +x"

alias :q="exit"
alias Exit="disown -a && exit"

abbrev-alias v="nvim"
abbrev-alias vim="nvim"

##### Working with disks
abbrev-alias lsblk="lsblk -f"
abbrev-alias umount-luks="sudo umount /media/luks && sudo cryptsetup close butterfly"
abbrev-alias driveoff="sudo hdparm -Y"
abbrev-alias webserver="python -m http.server 1234"

##### Fun commands
abbrev-alias gnuhead="cat /home/alex/.local/share/gnu-head-xterm"

##### Translator
abbrev-alias de:en="trans -shell de:en"
abbrev-alias en:de="trans -shell en:de"

##### Other
alias newsboat="newsboat -c $XDG_DATA_HOME/newsboatcache.db"
abbrev-alias topc="cd $HOME/CODE/utils/topc && python3 server.py"