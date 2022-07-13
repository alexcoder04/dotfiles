"        _                        _            ___  _  _   
"   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
"  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
" | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
"  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
" 
" Copyright (c) 2021-2022 alexcoder04 <https://github.com/alexcoder04>
" 
" doing stuff automaticly in nvim

" -----------------------------------------------------------------------------
" AUTOMATION
" -----------------------------------------------------------------------------

" put current line in the middle if typing
autocmd InsertEnter * norm zz

" format files with coc-prettier
if $VIM_HEAVY_PLUGINS == "yes"
  autocmd BufWritePre *.js CocCommand prettier.formatFile
  autocmd BufWritePre *.json CocCommand prettier.formatFile
  autocmd BufWritePre *.css,*.scss,*.sass CocCommand prettier.formatFile
endif

" markdown table mode
autocmd FileType markdown TableModeEnable

" re-generate config files after editing
autocmd BufWritePost $DOTFILES_REPO/bash/bashrc !$DOTFILES_REPO/install bash
autocmd BufWritePost $DOTFILES_REPO/cron/crontab !$DOTFILES_REPO/install cron
autocmd BufWritePost $DOTFILES_REPO/lf/*lfrc,$DOTFILES_REPO/lf/previewer.sh !$DOTFILES_REPO/install lf
autocmd BufWritePost $DOTFILES_REPO/nvim/*.vim,$DOTFILES_REPO/nvim/*.template !$DOTFILES_REPO/install nvim
autocmd BufWritePost $DOTFILES_REPO/qutebrowser/config.py !$DOTFILES_REPO/install qutebrowser
autocmd BufWritePost $DOTFILES_REPO/zsh/*.zsh,$DOTFILES_REPO/zsh/z* !$DOTFILES_REPO/install zsh

