"        _                        _            ___  _  _   
"   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
"  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
" | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
"  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
" 
" Copyright (c) 2021-2022 alexcoder04 <https://github.com/alexcoder04>
"                                                          
" common settings for nvim and nvimpager

" -----------------------------------------------------------------------------
" BASIC SETTINGS
" ------------------------------------------------------------------------- {{{
filetype plugin indent on
set fileformat=unix
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
syntax on

" }}}

" -----------------------------------------------------------------------------
" FILE TYPES
" ------------------------------------------------------------------------- {{{
" detect
autocmd BufEnter $DOTFILES_REPO/i3/*.config set filetype=i3config
autocmd BufEnter $DOTFILES_REPO/i3/blocks*.conf set filetype=dosini
autocmd BufEnter $DOTFILES_REPO/lf/*lfrc set filetype=config
autocmd BufEnter $DOTFILES_REPO/nvim/*.template set filetype=vim
autocmd BufEnter $DOTFILES_REPO/sh/aliases set filetype=sh
autocmd BufEnter $DOTFILES_REPO/sh/env set filetype=sh
autocmd BufEnter $XDG_CONFIG_HOME/i3/config set filetype=i3config
autocmd BufEnter $XDG_CONFIG_HOME/i3blocks/config set filetype=dosini
autocmd BufEnter $XDG_CONFIG_HOME/lf/lfrc set filetype=config
autocmd BufEnter *ewsboat/*.urls set filetype=conf
autocmd BufEnter *.muttrc set filetype=neomuttrc
autocmd BufEnter *.prefs2 set filetype=sh
autocmd BufEnter *.tex set filetype=tex
autocmd BufEnter *bumblebee-status.conf set filetype=dosini
autocmd BufEnter *dunstrc set filetype=dosini
autocmd BufEnter *mbsyncrc set filetype=config
autocmd BufEnter /etc/init.d/* set filetype=sh

" settings
autocmd BufEnter *.c set tabstop=4 shiftwidth=4 expandtab
autocmd BufEnter *.sh set tabstop=2 shiftwidth=2 expandtab
autocmd FileType tex set tw=80

" }}}

" -----------------------------------------------------------------------------
" SYNTAX
" ------------------------------------------------------------------------- {{{
autocmd FileType lua syn match luaNspireEvent /on\.\w*/ contained
autocmd FileType lua syn match luaNspireGc /gc:\(clipRect\|drawArc\|drawImage\|drawLine\|drawPolyLine\|drawRect\|drawString\|fillArc\|fillPolygon\|fillRect\|getStringHeight\|getStringWidth\|setAlpha\|setColorRGB\|setFont\|setPen\)/ contained
autocmd FileType lua syn match luaNspirePlatform /platform\.window:invalidate/ contained

" }}}

" -----------------------------------------------------------------------------
" PLUGINS
" ------------------------------------------------------------------------- {{{
call plug#begin()

" syntax plugins
Plug 'mboughaba/i3config.vim'
Plug 'https://git.sr.ht/~sircmpwn/hare.vim'
Plug 'ap/vim-css-color'

" editor plugins
if get(g:, 'load_editor_plugins', "no") == "yes"
  Plug 'dhruvasagar/vim-table-mode'

  if $VIM_HEAVY_PLUGINS == "yes"
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  endif
endif

call plug#end()

" }}}

" -----------------------------------------------------------------------------
" APPEARANCE
" ------------------------------------------------------------------------- {{{
set termguicolors
set cursorline

source $XDG_CONFIG_HOME/nvim/color.vim

" }}}

