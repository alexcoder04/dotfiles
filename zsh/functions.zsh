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
    sxhkd) $EDITOR "$DOTFILES_REPO/sxhkd/sxhkdrc" ;;
    *) echo "$1 is not a valid argument" ;;
  esac
}

show_image_url(){
  tempfile="${TMPDIR:-/tmp}/${1##*/}"
  curl "$1" >"$tempfile" \
    && nsxiv "$tempfile" & disown
}

# download and show some information that is hard to remember
remember(){
  case "$1" in
    ascii) show_image_url "https://www.translationroyale.com/wp-content/uploads/2020/02/ASCII-Table-The-History-of-Unicode-and-Its-Role-in-the-Digital-World-Translation-Royale-1024x959.png" ;;
    raspi-pins) show_image_url "https://i1.wp.com/mbrobotics.es/blog/wp-content/uploads/2018/05/Raspberry-GPIO-Pins_B_plus.jpg" ;;
    latex-colors) show_image_url "https://sharelatex-wiki-cdn-671420.c.cdn77.org/learn-scripts/images/d/d3/ColoursEx6.png" ;;
    list) echo "ascii, raspi-pins, latex-colors" ;;
    *) echo "invalid argument" ;;
  esac
}

# mount a luks encrypted drive
# use:
# `mount-luks /dev/sdX <mapper-name>` # /dev/sdX -> /media/<mapper-name>
mount-luks(){
  [ -z "$1" ] && exit 1
  if [ "$1" = "--help" ]; then
    echo "mount-luks /dev/sdX <name> # => /dev/sdX -> /media/<name>"
    return 0
  fi
  [ -z "$2" ] && exit 1
  doas cryptsetup open "$1" "$2" \
    && doas mount -v "/dev/mapper/$2" "/media/$2"
}

