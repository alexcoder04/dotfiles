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
set nocompatible
set mouse=
set clipboard+=unnamedplus
set tabstop=4 softtabstop=4
set number relativenumber
set smartcase
set colorcolumn=80
set ignorecase
let mapleader=" "
filetype plugin indent on
syntax on

" -------------------------------------------------
" PLUGINS
" -------------------------------------------------
call plug#begin()

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'

call plug#end()

" -------------------------------------------------
" APPEARANCE
" -------------------------------------------------
set termguicolors
set cursorline
colorscheme dracula
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" -------------------------------------------------
" KEYBINDINGS
" -------------------------------------------------
" file tree and fuzzy finder
nmap <C-n> :NERDTreeToggle<CR>
" navigate between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" disable arrow keys in normal mode
nnoremap <Left> :echo "you fool..."<CR>
nnoremap <Right> :echo "you fool..."<CR>
nnoremap <Up> :echo "you fool..."<CR>
nnoremap <Down> :echo "you fool..."<CR>

" search highlight
nnoremap / :set<Space>hlsearch<CR>/

" jump to the next placeholder
inoremap ;; <Esc>:set<Space>nohlsearch<CR>/<++><CR>"_c4l
inoremap :; ;;
nnoremap <Space><Space> :set<Space>nohlsearch<CR>/<++><CR>"_c4l

" -------------------------------------------------
" AUTOMATION
" -------------------------------------------------
" put current line in the middle if typing
autocmd InsertEnter * norm zz

" remove trailing white spaces on save
autocmd BufWritePre * %s/\s+$//e

" format JS files with coc-prettier
autocmd BufWritePre *.js CocCommand prettier.formatFile
autocmd BufWritePre *.json CocCommand prettier.formatFile
autocmd BufWritePre *.css CocCommand prettier.formatFile
autocmd BufWritePre *.html CocCommand prettier.formatFile

" auto-compile beamer presentations on save
autocmd FileType markdown nnoremap <leader>p :!pdf-preview "%"<CR>
autocmd FileType markdown nnoremap <leader>a :!autocompile-toggle "%" &<CR>

" re-generate config files after editing
autocmd BufWritePost +DOTFILES_REPO+/vim/init.vim !+DOTFILES_REPO+/install vim
autocmd BufWritePost +DOTFILES_REPO+/fish/dynamic/config.fish !+DOTFILES_REPO+/install fish
autocmd BufWritePost +DOTFILES_REPO+/bash/bashrc !+DOTFILES_REPO+/install bash
autocmd BufWritePost +DOTFILES_REPO+/wm-utils/sxhkdrc !+DOTFILES_REPO+/install wm-utils && killall sxhkd && sxhkd &
autocmd BufWritePost +DOTFILES_REPO+/zsh/zshrc !+DOTFILES_REPO+/install zsh
autocmd BufWritePost +DOTFILES_REPO+/zsh/zshenv !+DOTFILES_REPO+/install zsh
autocmd BufWritePost +DOTFILES_REPO+/cron/crontab !+DOTFILES_REPO+/install cron

" copy arduino files to clipboard on save
autocmd BufWritePost *.ino !cat "%" | xclip -selection clipboard

" compile a project
nnoremap <leader>b :!./build.sh<CR>

" -------------------------------------------------
" AUTO-INSERT OFTEN USED PHRASES
" -------------------------------------------------

" html tags
autocmd FileType html nnoremap ;! i<!DOCTYPE html><Enter><html<Space>dir="ltr"><Enter><head><Enter><meta<Space>charset="utf-8"<Space>/><Enter><meta<Space>name="viewport"<Space>content="width=device-width,<Space>initial-scale=1.0"><Enter><title><++></title><Enter><++><Enter></head><Enter><body><Enter><++><Enter></body><Enter></html><Esc>gg/<++><CR>"_c4l
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
autocmd FileType html inoremap ;s <script<Space>src="" defer></script><Enter><++><Esc>k0f"a
autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Enter><++><Esc>k0f"a
autocmd FileType html inoremap ;btn <button id=""><++></button><Enter><++><Esc>k0f"a

" JS
autocmd FileType javascript inoremap ;cl console.log();<Enter><++><Esc>k0t(a

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
autocmd FileType arduino inoremap ;void void (<++>){<Enter><++><Enter>}<Enter><++><Esc>3k0t(a
autocmd FileType arduino inoremap ;int int (<++>){<Enter><++><Enter>return <++>;<Enter>}<Enter><++><Esc>4k0t(a
autocmd FileType arduino inoremap ;if if (){<Enter><++><Enter>}<Enter><++><Esc>3k0t)a
autocmd FileType arduino inoremap ;d delay();<Enter><++><Esc>k0t)a
autocmd FileType arduino inoremap ;spr Serial.print();<Enter><++><Esc>k0t)a
autocmd FileType arduino inoremap ;spl Serial.println();<Enter><++><Esc>k0t)a

" auto-generate shebangs
autocmd FileType python nnoremap #! ggO#!/usr/bin/env<Space>python3<Esc>
autocmd FileType sh nnoremap #! ggO#!/bin/sh<Esc>

" newsboat yt subs
autocmd FileType conf inoremap ;y https://www.youtube.com/feeds/videos.xml?channel_id=<++><Space>"yt"<Space><++><Esc>0

" -------------------------------------------------
" OTHER STUFF
" -------------------------------------------------
" coc config
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-eslint'
  \ ]

