"        _                        _            ___  _  _   
"   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
"  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
" | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
"  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
" 
" Copyright (c) 2022 alexcoder04 <alexcoder04@protonmail.com>
" 
" Neovim status line

" mode maps {{{
let s:ul_mode_map = {
    \ 'n': 'NORMAL',
    \ 'i': 'INSERT',
    \ 'R': 'REPLACE',
    \ 'v': 'VISUAL',
    \ 'V': 'V-LINE',
    \ "\<C-v>": 'V-BLOCK',
    \ 'c': 'COMMAND',
    \ 's': 'SELECT',
    \ 'S': 'S-LINE',
    \ "\<C-s>": 'S-BLOCK',
    \ 't': 'TERMINAL'
    \ }
let s:ul_mode_color_map = {
    \ 'n': "%#ULNormalMode#",
    \ 'i': "%#ULInsertMode#",
    \ 'v': "%#ULVisualMode#",
    \ 'V': "%#ULVisualMode#",
    \ "\<C-v>": "%#ULVisualMode#",
    \ 'c': "%#ULCommandMode#"
    \ }

" }}}

" components {{{
function! ULGetMode()
    return "" . get(s:ul_mode_color_map, mode(), "") . "\ " . get(s:ul_mode_map, mode(), "") .  "\ %#ULDefault#"
endfunction

function! ULGetFileName()
    let fname = expand("%:p")
    let wsize = winwidth("%")
    if len(fname) > wsize - 43 " this is pretty arbitrary
        return "\ %f\ "
    else
        return "\ %F\ "
    endif
endfunction

function! ULGetReadonly()
    if &readonly == 1
        return "%#ULReadonly#\ [RO]%#ULDefault#"
    endif
    return ""
endfunction

function! ULGetModified()
    if &modified == 1
        return "%#ULModified#\ [M]%#ULDefault#"
    endif
    return ""
endfunction

function! ULGetFileInfo()
    return "%#ULDefault#[\ %#ULLanguage#" . toupper(&filetype) . "%#ULDefault#\ |\ " . &fileencoding . "\ |\ " . &fileformat . "\ ]"
endfunction

function! ULGetFilePosition()
    return "%#UlPosition#%3(%c%):%#UlLine#%3(%l%)%#UlPosition#/%#UlLines#%L%#UlPosition#\ (%3(%p%)%%)"
endfunction

" }}}

" put everything together
set laststatus=2

set statusline=%{%ULGetMode()%}%{%ULGetReadonly()%}%{%ULGetModified()%}%{%ULGetFileName()%}%#Normal#
set statusline+=%=
set statusline+=%{%ULGetFileInfo()%}%#Normal#\ %{%ULGetFilePosition()%}

