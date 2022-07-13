
au BufNewFile,BufRead $DOTFILES_REPO/i3/*.config set filetype=i3config
au BufNewFile,BufRead $DOTFILES_REPO/i3/blocks*.conf set filetype=dosini
au BufNewFile,BufRead $DOTFILES_REPO/lf/*lfrc set filetype=config
au BufNewFile,BufRead $DOTFILES_REPO/nvim/*.template set filetype=vim
au BufNewFile,BufRead $DOTFILES_REPO/sh/aliases set filetype=sh
au BufNewFile,BufRead $DOTFILES_REPO/sh/env set filetype=sh

au BufNewFile,BufRead $XDG_CONFIG_HOME/i3/config set filetype=i3config
au BufNewFile,BufRead $XDG_CONFIG_HOME/i3blocks/config set filetype=dosini
au BufNewFile,BufRead $XDG_CONFIG_HOME/lf/lfrc set filetype=config

au BufNewFile,BufRead *.muttrc set filetype=neomuttrc
au BufNewFile,BufRead *.prefs2 set filetype=sh
au BufNewFile,BufRead *.tex set filetype=tex
au BufNewFile,BufRead *bumblebee-status.conf set filetype=dosini
au BufNewFile,BufRead *dunstrc set filetype=dosini
au BufNewFile,BufRead *ewsboat/*.urls set filetype=conf
au BufNewFile,BufRead *mbsyncrc set filetype=config
au BufRead,BufNewFile *.ha set filetype=hare

au BufNewFile,BufRead /etc/init.d/* set filetype=sh

