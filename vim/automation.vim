"        _                        _            ___  _  _   
"   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
"  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
" | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
"  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
" 
" Copyright (c) 2021 alexcoder04 <https://github.com/alexcoder04>
" 
" doing stuff automaticly in nvim

" -------------------------------------------------
" AUTOMATION
" -------------------------------------------------
" fix file types
autocmd BufEnter $DOTFILES_REPO/i3/*.config set filetype=i3config
autocmd BufEnter $DOTFILES_REPO/sh/aliases set filetype=sh
autocmd BufEnter $DOTFILES_REPO/sh/env set filetype=sh
autocmd BufEnter $XDG_CONFIG_HOME/i3/config set filetype=i3config
autocmd BufEnter $XDG_CONFIG_HOME/lf/lfrc set filetype=conf
autocmd BufEnter $XDG_CONFIG_HOME/newsboat/*.urls set filetype=conf
autocmd BufEnter *.muttrc set filetype=neomuttrc
autocmd BufEnter *.prefs2 set filetype=sh
autocmd BufEnter *.tex set filetype=tex
autocmd BufEnter *dunstrc set filetype=dosini
autocmd BufEnter /etc/init.d/* set filetype=sh

" settings for diffrent file types
autocmd BufEnter *.c set tabstop=4 shiftwidth=4 expandtab
autocmd BufEnter *.sh set tabstop=2 shiftwidth=2 expandtab
autocmd FileType tex set tw=80

" put current line in the middle if typing
autocmd InsertEnter * norm zz

" remove trailing white spaces on save
autocmd BufWritePre * %s/\s+$//e

" format files with coc-prettier
if $VIM_HEAVY_PLUGINS == "yes"
  autocmd BufWritePre *.js CocCommand prettier.formatFile
  autocmd BufWritePre *.json CocCommand prettier.formatFile
  autocmd BufWritePre *.css CocCommand prettier.formatFile
endif

" re-generate config files after editing
autocmd BufWritePost $DOTFILES_REPO/vim/*.vim !$DOTFILES_REPO/install vim
autocmd BufWritePost $DOTFILES_REPO/fish/dynamic/config.fish !$DOTFILES_REPO/install fish
autocmd BufWritePost $DOTFILES_REPO/bash/bashrc !$DOTFILES_REPO/install bash
autocmd BufWritePost $DOTFILES_REPO/wm-utils/sxhkdrc !$DOTFILES_REPO/install wm-utils && killall sxhkd && sxhkd &
autocmd BufWritePost $DOTFILES_REPO/zsh/* !$DOTFILES_REPO/install zsh
autocmd BufWritePost $DOTFILES_REPO/cron/crontab !$DOTFILES_REPO/install cron
autocmd BufWritePost $DOTFILES_REPO/lf/* !$DOTFILES_REPO/install lf
autocmd BufWritePost $DOTFILES_REPO/qutebrowser/config.py !$DOTFILES_REPO/install qutebrowser

" copy arduino files to clipboard on save to paste them into Arduino IDE
autocmd BufWritePost *.ino !cat "%" | xclip -selection clipboard

