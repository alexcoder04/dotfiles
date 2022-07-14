"        _                        _            ___  _  _   
"   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
"  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
" | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
"  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
" 
" Copyright (c) 2021-2022 alexcoder04 <https://github.com/alexcoder04>
"                                                          
" init.vim for NeoVim

" -----------------------------------------------------------------------------
" BASIC SETTINGS
" ------------------------------------------------------------------------- {{{
let mapleader=" "
set autoindent
set clipboard+=unnamedplus " system keyboard
set colorcolumn=80
set foldenable foldmethod=marker
set ignorecase smartcase
set mouse=nv
set number relativenumber
set timeoutlen=500

if $NVIMCACHE == ""
  set dir=$HOME/.cache/nvim
else
  set dir=$NVIMCACHE
endif

" }}}

" -----------------------------------------------------------------------------
" PLUGINS
" ------------------------------------------------------------------------- {{{
let g:load_editor_plugins = "yes"

" plugins themselves are loaded in common.vim }}}

" -----------------------------------------------------------------------------
" KEYBINDINGS
" ------------------------------------------------------------------------- {{{
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
nnoremap S :%s//g<Left><Left>

" jump to the next placeholder
inoremap ;; <Esc>:set<Space>nohlsearch<CR>/<++><CR>"_c4l
nnoremap <Space><Space> :set<Space>nohlsearch<CR>/<++><CR>"_c4l
inoremap :; ;;

" compile a project
nnoremap <leader>b :w<CR>:!./build.sh<CR>

" add nice copyright note
nnoremap <leader>cp gg:r<Space>~/Repos/alexcoder04/copyright-note-template<CR>

" format
if $VIM_HEAVY_PLUGINS == "yes"
  nnoremap <leader>f :CocCommand prettier.formatFile<CR>:w<CR>
  nnoremap <leader>fa :autocmd BufWritePre :CocCommand prettier.formatFile<CR>
endif

" build LaTeX and MD, run Python
autocmd BufEnter *.bm.md nnoremap <leader>P :w<CR>:!md-preview -i "%" -t beamer -e<CR>
autocmd BufEnter *.bm.md nnoremap <leader>p :w<CR>:!md-preview -i "%" -t beamer<CR>

" line width
nnoremap <leader>ll :set tw=80<CR>

" spelling
nnoremap <leader>r :setlocal spell spelllang=en_us<CR>
nnoremap <leader>R :setlocal spell spelllang=de<CR>
nnoremap <leader><c-r> :setlocal spell!<CR>

" }}}

" -----------------------------------------------------------------------------
" OTHER CONFIG FILES
" ------------------------------------------------------------------------- {{{
source $XDG_CONFIG_HOME/nvim/common.vim
source $XDG_CONFIG_HOME/nvim/automation.vim
source $XDG_CONFIG_HOME/nvim/statusline.vim
" }}}

" -----------------------------------------------------------------------------
" OTHER STUFF
" ------------------------------------------------------------------------- {{{
if $VIM_HEAVY_PLUGINS == "yes"
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

  " go stuff
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_generate_tags = 1
endif

" show syntax highlight group
function! Syn()
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
endfunction
nnoremap <leader>h :call Syn()<enter>

" }}}

