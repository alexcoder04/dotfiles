"        _                        _            ___  _  _   
"   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
"  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
" | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
"  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
" 
" Copyright (c) 2021-2022 alexcoder04 <https://github.com/alexcoder04>
"                                                          
" common settings for nvim and nvimpager

" -------------------------------------------------
" BASIC SETTINGS
" -------------------------------------------------
set nocompatible
set mouse=nv
set clipboard+=unnamedplus
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set autoindent
set fileformat=unix
set number relativenumber
set smartcase
set colorcolumn=80
set ignorecase
let mapleader=" "
filetype plugin indent on
syntax on
if $NVIMCACHE == ""
  set dir=$HOME/.cache/nvim
else
  set dir=$NVIMCACHE
endif

" -------------------------------------------------
" FILE TYPES
" -------------------------------------------------
" detect
autocmd BufEnter $DOTFILES_REPO/i3/*.config set filetype=i3config
autocmd BufEnter $DOTFILES_REPO/i3/blocks*.conf set filetype=dosini
autocmd BufEnter $DOTFILES_REPO/lf/*lfrc set filetype=config
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

" -------------------------------------------------
" PLUGINS
" -------------------------------------------------
call plug#begin()

Plug 'mboughaba/i3config.vim'
Plug 'https://git.sr.ht/~sircmpwn/hare.vim'
Plug 'ap/vim-css-color'

" editor plugins
let g:load_editor_plugins = get(g:, 'load_editor_plugins', "no")
if g:load_editor_plugins == "yes"
  Plug 'alexcoder04/lightline.vim' " own fork, because of colorschemes
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'luochen1990/rainbow'

  if $VIM_HEAVY_PLUGINS == "yes"
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  endif
endif

call plug#end()

" lightline config
source $XDG_CONFIG_HOME/nvim/lightline-env.vim
let g:lightline = {
  \ 'colorscheme': 'env'
  \ }
set noshowmode " we don't need to show the mode, lightline takes care of it

" -------------------------------------------------
" APPEARANCE
" -------------------------------------------------
set termguicolors
set cursorline

source $XDG_CONFIG_HOME/nvim/color.vim

