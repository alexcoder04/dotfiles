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

##### apt commands
abbrev-alias sagi="sudo apt install"
abbrev-alias sau="sudo apt update"
abbrev-alias saup="sudo apt upgrade"
abbrev-alias apts="apt search"
abbrev-alias alu="apt list --upgradeable"

##### git commands
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

##### basic terminal commands
alias cls='[ "$(seq 1 5 | shuf -n 1)" = "1" ] && timeout 0.5 cmatrix -u 1 -C cyan; clear'

# make ls look nice but still tty-friendly
if [ "$TERM" = "linux" ]; then
  alias ls="exa -hl --group-directories-first"
  alias la="exa -ahl --group-directories-first"
else
  alias ls="exa -hl --icons --group-directories-first"
  alias la="exa -ahl --icons --group-directories-first"
fi

# rm, cp, mv
abbrev-alias rm="rm -Iv"
abbrev-alias rmd="rm -Ifvr"
abbrev-alias mv="mv -Iv"
abbrev-alias cp="cp -Iv"
abbrev-alias cpd="cp -Ifvr"

abbrev-alias chx="chmod +x"

# how to exit the shell
alias :q="exit"
alias Exit="disown -a && exit"

##### programs
alias -g v="nvim"
alias -g vi="nvim"
alias -g vim="nvim"

alias -g p="pacman"
alias bat="bat --plain --theme=Dracula --paging=never"
alias lf="lf_run"
alias sudo="doas"
alias grep="grep --color=auto"
alias mbsync="mbsync -c ~/.config/mbsync/mbsyncrc"
alias newsboat="newsboat-selector"
abbrev-alias topc="cd $HOME/CODE/utils/topc && python3 server.py"
abbrev-alias mount-nspire="sudo LD_LIBRARY_PATH=/lib:/usr/local/lib nspire-fuse /media/nspire"

##### Working with disks
abbrev-alias lsblk="lsblk -f"
abbrev-alias umount-luks="sudo umount /media/luks && sudo cryptsetup close butterfly"
abbrev-alias driveoff="sudo hdparm -Y"
abbrev-alias webserver="python3 -m http.server 1234"

##### Fun commands
abbrev-alias gnuhead="cat /home/alex/.local/share/gnu-head-xterm"

##### Translator
abbrev-alias de:en="trans -shell de:en"
abbrev-alias en:de="trans -shell en:de"

