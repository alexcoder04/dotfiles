#!/usr/bin/zsh
#        _                        _            ___  _  _
#   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |
#  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_
# | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
#  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|
#
# Copyright (c) 2021 alexcoder04 <https://github.com/alexcoder04>
#      
# zsh functions

# edit config files
conf(){
  case "$1" in
    i3)    $EDITOR "$DOTFILES_REPO/i3/main.config" ;;
    bash)  $EDITOR "$DOTFILES_REPO/bash/bashrc" ;;
    zsh)   $EDITOR "$DOTFILES_REPO/zsh/zshrc" ;;
    vim)   $EDITOR "$DOTFILES_REPO/vim/init.vim" ;;
    sxhkd) $EDITOR "$DOTFILES_REPO/wm-utils/sxhkdrc" ;;
    *) echo "$1 is not a valid argument" ;;
  esac
}

# download and show some information that is hard to remember
remember(){
  case "$1" in
    ascii)
      curl "http://www.asciitable.com/index/asciifull.gif" \
        > /tmp/.ascii.gif
      nsxiv /tmp/.ascii.gif & ;;
    raspi_pins)
      curl "https://i1.wp.com/mbrobotics.es/blog/wp-content/uploads/2018/05/Raspberry-GPIO-Pins_B_plus.jpg" \
        > /tmp/.raspi.jpg
      nsxiv /tmp/.raspi.jpg & ;;
    latex_colors)
      curl "https://sharelatex-wiki-cdn-671420.c.cdn77.org/learn-scripts/images/d/d3/ColoursEx6.png" \
        >/tmp/latexcolors.png
      nsxiv /tmp/latexcolors.png & ;;
    *) echo "invalid argument" ;;
  esac
  disown
}

# mount a luks encrypted drive
# use:
# `luks-mount /dev/sdX <mapper-name>` # /dev/sdX -> /media/<mapper-name>
luks-mount(){
  [ -z "$1" ] && exit 1
  [ -z "$2" ] && exit 1
  doas cryptsetup open "$1" "$2" \
    && doas mount -v "/dev/mapper/$2" "/media/$2"
}

