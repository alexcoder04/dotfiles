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
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set autoindent
set fileformat=unix
set number relativenumber
set smartcase
set colorcolumn=80
set ignorecase
set dir=/media/cache/nvim
let mapleader=" "
filetype plugin indent on
syntax on

" -------------------------------------------------
" PLUGINS
" -------------------------------------------------
call plug#begin()

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
"Plug 'morhetz/gruvbox'
"Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'preservim/nerdtree'
Plug 'alexcoder04/lightline.vim' " own fork, because of colorschemes
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

" -------------------------------------------------
" APPEARANCE
" -------------------------------------------------
set termguicolors
set cursorline
colorscheme dracula
" override background color, so it's transparent
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" -------------------------------------------------
" KEYBINDINGS
" -------------------------------------------------
" file tree and fuzzy finder
"nmap <C-n> :NERDTreeToggle<CR>
" disable arrow keys in normal mode xD
nnoremap <Left> :echo "you fool..."<CR>
nnoremap <Right> :echo "you fool..."<CR>
nnoremap <Up> :echo "you fool..."<CR>
nnoremap <Down> :echo "you fool..."<CR>
" working with tabs
nnoremap <leader>g :tabnext<CR>
nnoremap <leader>G :tabprevious<CR>
nnoremap <C-t> :tabnew<Space>
" working with splits
nnoremap <leader>S :split<Space>
nnoremap <leader>s :vsplit<Space>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L
nnoremap <leader><C-h> :vertical resize -5<CR>
nnoremap <leader><C-j> :resize +5<CR>
nnoremap <leader><C-k> :resize -5<CR>
nnoremap <leader><C-l> :vertical resize +5<CR>

" search highlight
nnoremap / :set<Space>hlsearch<CR>/

" global replace
nnoremap S :%s///g<Left><Left><Left>

" jump to the next placeholder
inoremap ;; <Esc>:set<Space>nohlsearch<CR>/<++><CR>"_c4l
inoremap :; ;;
nnoremap <Space><Space> :set<Space>nohlsearch<CR>/<++><CR>"_c4l

" -------------------------------------------------
" DO STUFF WITH LEADER KEY
" -------------------------------------------------
" compile a project
nnoremap <leader>b :!./build.sh<CR>

" add a vim setings line for tabs=2
nnoremap <leader>t2 ggo#<Space>vim:<Space>tabstop=2<Space>shiftwidth=2<Space>expandtab<Esc>

" add nice copyright note
nnoremap <leader>cp gg:r<Space>~/Projects/alexcoder04/copyright-note-template<CR>

" format
nnoremap <leader>f :CocCommand prettier.formatFile<CR>:w<CR>
nnoremap <leader>fa :autocmd BufWritePre :CocCommand prettier.formatFile<CR>

" build LaTeX and MD, run Python
autocmd FileType tex nnoremap <leader>p :w<CR>:!latex-build "%"<CR>
autocmd FileType markdown nnoremap <leader>p :w<CR>:!md-preview -i "%"<CR>
autocmd FileType markdown nnoremap <leader>P :w<CR>:!md-preview -i "%" -e<CR>
autocmd BufEnter *.bm.md nnoremap <leader>p :w<CR>:!md-preview -i "%" -t beamer<CR>
autocmd BufEnter *.bm.md nnoremap <leader>P :w<CR>:!md-preview -i "%" -t beamer -e<CR>
autocmd FileType python nnoremap <leader>p :w<CR>:!python3 "%"<CR>

" LaTeX \begin\end ENV
autocmd FileType tex nnoremap <leader>e yyI\begin{<Esc>A}<Esc>pI\end{<Esc>A}<Esc>O
autocmd FileType tex imap ;e <Esc>b<leader>e

" table mode in MD
autocmd FileType markdown TableModeEnable
autocmd FileType markdown nnoremap <leader>tm :TableModeToggle<CR>

" line width
nnoremap <leader>ll :set tw=80<CR>

" -------------------------------------------------
" AUTOMATION
" -------------------------------------------------
" fix file types
autocmd BufEnter *.tex set filetype=tex
autocmd BufEnter *.muttrc set filetype=neomuttrc
autocmd BufEnter *dunstrc set filetype=dosini

" tab settings for diffrent file types
autocmd BufEnter *.c set tabstop=4 shiftwidth=4 expandtab
autocmd BufEnter *.sh set tabstop=2 shiftwidth=2 expandtab

" put current line in the middle if typing
autocmd InsertEnter * norm zz

" remove trailing white spaces on save
autocmd BufWritePre * %s/\s+$//e

" format JS files with coc-prettier
autocmd BufWritePre *.js CocCommand prettier.formatFile
autocmd BufWritePre *.json CocCommand prettier.formatFile
autocmd BufWritePre *.css CocCommand prettier.formatFile

" re-generate config files after editing
autocmd BufWritePost $DOTFILES_REPO/vim/init.vim !$DOTFILES_REPO/install vim
autocmd BufWritePost $DOTFILES_REPO/fish/dynamic/config.fish !$DOTFILES_REPO/install fish
autocmd BufWritePost $DOTFILES_REPO/bash/bashrc !$DOTFILES_REPO/install bash
autocmd BufWritePost $DOTFILES_REPO/wm-utils/sxhkdrc !$DOTFILES_REPO/install wm-utils && killall sxhkd && sxhkd &
autocmd BufWritePost $DOTFILES_REPO/zsh/* !$DOTFILES_REPO/install zsh
autocmd BufWritePost $DOTFILES_REPO/cron/crontab !$DOTFILES_REPO/install cron
autocmd BufWritePost $DOTFILES_REPO/lf/* !$DOTFILES_REPO/install lf
autocmd BufWritePost $DOTFILES_REPO/qutebrowser/config.py !$DOTFILES_REPO/install qutebrowser

" copy arduino files to clipboard on save to paste them into Arduino IDE
autocmd BufWritePost *.ino !cat "%" | xclip -selection clipboard

" settings in LaTeX
autocmd FileType tex set tw=80

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
autocmd FileType html inoremap ;s <script<Space>src=""<Space>defer></script><Enter><++><Esc>k0f"a
autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Enter><++><Esc>k0f"a
autocmd FileType html inoremap ;btn <button id=""><++></button><Enter><++><Esc>k0f"a

" JS
autocmd FileType javascript inoremap ;cl console.log();<Enter><++><Esc>k0t(i

" markdown
autocmd FileType markdown inoremap ;i ** <++><Esc>F*i
autocmd FileType markdown inoremap ;b **** <++><Esc>F*hi
autocmd FileType markdown inoremap ;` ```<Enter><++><Enter>```<Enter><++><Esc>3kA
autocmd FileType markdown inoremap ;1 #<Enter><++><Esc>kA<Space>
autocmd FileType markdown inoremap ;2 ##<Enter><++><Esc>kA<Space>
autocmd FileType markdown inoremap ;3 ###<Enter><++><Esc>kA<Space>
autocmd FileType markdown inoremap ;l <Enter><Esc>I<Space>-<Space>

" LaTeX
autocmd FileType tex inoremap ;1 \section{}<Enter><++><Esc>k0f{a
autocmd FileType tex inoremap ;2 \subsection{}<Enter><++><Esc>k0f{a
autocmd FileType tex inoremap ;3 \subsubsection{}<Enter><++><Esc>k0f{a
autocmd FileType tex inoremap ;4 \subsubsubsection{}<Enter><++><Esc>k0f{a
autocmd FileType tex inoremap ;i \textit{}<Space><++><Esc>F{a
autocmd FileType tex inoremap ;b \textbf{}<Space><++><Esc>F{a
autocmd FileType tex inoremap ;i \emph{}<Space><++><Esc>F{a
autocmd FileType tex inoremap ;u \underline{}<Space><++><Esc>F{a
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter>\item<Space><Enter>\end{itemize}<Esc>kA
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter>\item<Space><Enter>\end{enumerate}<Esc>kA
autocmd FileType tex inoremap ;l <Enter>\item<Space>

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
  \ 'coc-eslint',
  \ 'coc-pyright'
  \ ]

" lightline config
let g:lightline = {
  \ 'colorscheme': 'dracula'
  \ }
set noshowmode " we don't need to show the mode, lightline takes care of it

