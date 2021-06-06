"        _                        _            ___  _  _   
"   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
"  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
" | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
"  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
" 
" Copyright (c) 2021 alexcoder04 <https://github.com/alexcoder04>
"                                                          
" init.vim for NeoVim

" -------------------------------------------------
" BASIC SETTINGS
" -------------------------------------------------
syntax on
let mapleader=" "
set mouse=
set ignorecase
set clipboard+=unnamedplus
set number relativenumber

" -------------------------------------------------
" APPEARANCE
" -------------------------------------------------
set termguicolors
set cursorline
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" -------------------------------------------------
" PLUGINS
" -------------------------------------------------
call plug#begin()

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" -------------------------------------------------
" KEYBINDINGS
" -------------------------------------------------
" file tree and fuzzy finder
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-p> :Files<CR>
" navigate between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" disable arrow keys
nnoremap <Left> :echo "you fool..."<CR>
inoremap <Left> <C-o>:echo "you fool..."<CR>
nnoremap <Right> :echo "you fool..."<CR>
inoremap <Right> <C-o>:echo "you fool..."<CR>
nnoremap <Up> :echo "you fool..."<CR>
nnoremap <Down> :echo "you fool..."<CR>

" search highlight
nnoremap / :set<Space>hlsearch<CR>/

" jump to the next placeholder
inoremap <Space><Space> <Esc>:set<Space>nohlsearch<CR>/<++><CR>"_c4l
nnoremap <Space><Space> <Esc>:set<Space>nohlsearch<CR>/<++><CR>"_c4l

" -------------------------------------------------
" AUTOMATION
" -------------------------------------------------
" put current line in the middle if typing
autocmd InsertEnter * norm zz

" remove trailing white spaces on save
autocmd BufWritePre * %s/\s+$//e

" format JS files with coc-prettier
autocmd BufWritePre *.js CocCommand prettier.formatFile

" auto-compile beamer presentations on save
autocmd BufWritePost *.bm.md !pandoc -t beamer "%" -o presentation.pdf & && xreader presentation.pdf &

" re-generate config files after editing
autocmd BufWritePost */vim/init.vim !confmgr install vim
autocmd BufWritePost */fish/dynamic/config.fish !confmgr install fish

" -------------------------------------------------
" AUTO-INSERT OFTEN USED PHRASES
" -------------------------------------------------

" html tags
autocmd FileType html nnoremap ;! i<!DOCTYPE html><Enter><html<Space>dir="ltr"><Enter><head><Enter><meta<Space>charset="utf-8"<Space>/><Enter><title><++></title><Enter><++><Enter></head><Enter><body><Enter><++><Enter></body><Enter></html><Esc>gg/<++><CR>"_c4l
autocmd FileType html inoremap ;d <div></div><Enter><++><Esc>k0f>a
autocmd FileType html inoremap ;p <p></p><Enter><++><Esc>k0f>a
autocmd FileType html inoremap ;1 <h1></h1><Enter><++><Esc>k0f>a
autocmd FileType html inoremap ;2 <h2></h2><Enter><++><Esc>k0f>a
autocmd FileType html inoremap ;3 <h3></h3><Enter><++><Esc>k0f>a
autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ;ul <ul><Enter><Enter></ul><Enter><++><Esc>2ki
autocmd FileType html inoremap ;li <li></li><Enter><++><Esc>k0f>a
autocmd FileType html inoremap ;ln <link<Space>rel="stylesheet"<Space>href="" /><Enter><++><Esc>k$F"i
autocmd FileType html inoremap ;s <script<Space>src=""></script><Enter><++><Esc>k0f"a
autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Enter><++><Esc>k0f"a

" markdown
autocmd FileType markdown nnoremap ;! :r ~/Vorlagen/presentation.bm.md.drf<CR>ggdd/<++><CR>"_c4l
autocmd FileType markdown inoremap ;i ** <++><Esc>F*i
autocmd FileType markdown inoremap ;b **** <++><Esc>F*hi
autocmd FileType markdown inoremap ;` ```<Enter><++><Enter>```<Enter><++><Esc>3kA
autocmd FileType markdown inoremap ;1 #<Enter><++><Esc>kA<Space>
autocmd FileType markdown inoremap ;2 ##<Enter><++><Esc>kA<Space>
autocmd FileType markdown inoremap ;3 ###<Enter><++><Esc>kA<Space>
autocmd FileType markdown inoremap ;l <Enter><Esc>I<Space>-<Space>

" python
autocmd FileType python inoremap ;if if :<Enter><++><Enter><Backspace><++><Esc>2k0t:a
autocmd FileType python inoremap ;ie if :<Enter><++><Enter>else:<Enter><++><Enter><Backspace><++><Esc>4k0t:a
autocmd FileType python inoremap ;ir if :<Enter><++><Enter>return<++><Enter><Backspace><++><Esc>3k0t:a
autocmd FileType python inoremap ;l elif :<Enter><++><Enter><Backspace><++><Esc>2k0t:a
autocmd FileType python inoremap ;e else:<Enter><Backspace><++><Esc>kA<Enter>
autocmd FileType python inoremap ;f for in <++>:<Enter><++><Enter><Backspace><++><Esc>2k0tii<Space>
autocmd FileType python inoremap ;w while :<Enter><++><Enter><Backspace><++><Esc>2k0t:a
autocmd FileType python inoremap ;p print()<Enter><++><Esc>kt)a
autocmd FileType python inoremap ;s self.
autocmd FileType python inoremap ;d def (<++>):<Enter><++><Enter><Backspace><++><Esc>2k0t(a
autocmd FileType python inoremap ;t try :<Enter><++><Enter>except <++>Exception:<Enter><++><Enter><Backspace><++><Esc>4k0t:a
autocmd FileType python inoremap ;c class :<Enter>def __init__(self<++>):<Enter><++><Enter><Backspace><++><Enter><Backspace><++><Esc>4k0t:a
autocmd FileType python inoremap ;r return<Space>
autocmd FileType python inoremap ;im if<Space>__name__<Space>==<Space>"__main__":<Enter>

" arduino
autocmd FileType arduino inoremap ;v void (<++>){<Enter><++><Enter>}<Enter><++><Esc>3k0t(a
autocmd FileType arduino inoremap ;int int (<++>){<Enter><++><Enter>return <++>;<Enter>}<Enter><++><Esc>4k0t(a
autocmd FileType arduino inoremap ;if if (){<Enter><++><Enter>}<Enter><++><Esc>3k0t)a
autocmd FileType arduino inoremap ;d delay();<Enter><++><Esc>k0t)a

" auto-generate shebangs
autocmd FileType python nnoremap #! ggO#!/usr/bin/env<Space>python3<Esc>
autocmd FileType sh nnoremap #! ggO#!/bin/sh<Esc>

" -------------------------------------------------
" OTHER STUFF
" -------------------------------------------------
" coc config
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-json'
  \ ]

