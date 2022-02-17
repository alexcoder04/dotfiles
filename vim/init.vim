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
" PLUGINS
" -------------------------------------------------
call plug#begin()

" color schemes
Plug 'morhetz/gruvbox'
"Plug 'altercation/vim-colors-solarized'
"Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'alexcoder04/lightline.vim' " own fork, because of colorschemes
Plug 'dhruvasagar/vim-table-mode'
Plug 'mboughaba/i3config.vim'

if $VIM_HEAVY_PLUGINS == "yes"
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
endif

call plug#end()

" -------------------------------------------------
" APPEARANCE
" -------------------------------------------------
set termguicolors
set cursorline
"colorscheme dracula
colorscheme gruvbox
" override background color, so it's transparent
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" -------------------------------------------------
" KEYBINDINGS
" -------------------------------------------------
" file tree and fuzzy finder
"nmap <C-n> :NERDTreeToggle<CR>
" disable arrow keys in normal mode xD
"nnoremap <Left> :echo "you fool..."<CR>
"nnoremap <Right> :echo "you fool..."<CR>
"nnoremap <Up> :echo "you fool..."<CR>
"nnoremap <Down> :echo "you fool..."<CR>
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
nnoremap <Space><Space> :set<Space>nohlsearch<CR>/<++><CR>"_c4l
inoremap :; ;;

" -------------------------------------------------
" DO STUFF WITH LEADER KEY
" -------------------------------------------------
" compile a project
nnoremap <leader>b :w<CR>:!./build.sh<CR>

" add a vim setings line for tabs=2
nnoremap <leader>t2 ggo#<Space>vim:<Space>tabstop=2<Space>shiftwidth=2<Space>expandtab<Esc>

" add nice copyright note
nnoremap <leader>cp gg:r<Space>~/Projects/alexcoder04/copyright-note-template<CR>

" format
if $VIM_HEAVY_PLUGINS == "yes"
  nnoremap <leader>f :CocCommand prettier.formatFile<CR>:w<CR>
  nnoremap <leader>fa :autocmd BufWritePre :CocCommand prettier.formatFile<CR>
endif

" build LaTeX and MD, run Python
autocmd FileType tex nnoremap <leader>p :w<CR>:!latex-build "%"<CR>
autocmd FileType markdown nnoremap <leader>p :w<CR>:!md-preview -i "%"<CR>
autocmd FileType markdown nnoremap <leader>P :w<CR>:!md-preview -i "%" -e<CR>
autocmd BufEnter *.bm.md nnoremap <leader>p :w<CR>:!md-preview -i "%" -t beamer<CR>
autocmd BufEnter *.bm.md nnoremap <leader>P :w<CR>:!md-preview -i "%" -t beamer -e<CR>
autocmd FileType python nnoremap <leader>p :w<CR>:!python3 "%"<CR>
autocmd FileType go nnoremap <leader>p :w<CR>:GoRun .<CR>

" LaTeX \begin\end ENV
autocmd FileType tex nnoremap <leader>e yyI\begin{<Esc>A}<Esc>pI\end{<Esc>A}<Esc>O
autocmd FileType tex imap ;e <Esc>b<leader>e

" table mode in MD
autocmd FileType markdown TableModeEnable
autocmd FileType markdown nnoremap <leader>tm :TableModeToggle<CR>

" line width
nnoremap <leader>ll :set tw=80<CR>

" -------------------------------------------------
" OTHER CONFIG FILES
" -------------------------------------------------
source $XDG_CONFIG_HOME/nvim/snippets.vim
source $XDG_CONFIG_HOME/nvim/automation.vim

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
  \ 'coc-pyright',
  \ 'coc-go'
  \ ]

" lightline config
let g:lightline = {
  \ 'colorscheme': 'gruvbox'
  \ }
set noshowmode " we don't need to show the mode, lightline takes care of it


" go stuff
if $VIM_HEAVY_PLUGINS == "yes"
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_generate_tags = 1
endif

