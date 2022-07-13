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
" PLUGINS
" ------------------------------------------------------------------------- {{{
call plug#begin()

" syntax plugins
Plug 'mboughaba/i3config.vim'
Plug 'https://git.sr.ht/~sircmpwn/hare.vim', { 'for': 'hare' }
Plug 'ap/vim-css-color'

" editor plugins
if get(g:, 'load_editor_plugins', "no") == "yes"
  Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }

  if $VIM_HEAVY_PLUGINS == "yes"
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
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

