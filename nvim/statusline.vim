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

" highlighting {{{
hi ULDefault guibg=#112233 guifg=#e0e4fb
hi ULNormalMode guibg=#b748bc guifg=#e0e4fb gui=bold
hi ULInsertMode guibg=#2aa7e9 guifg=#112233 gui=bold
hi ULVisualMode guibg=#ffb11a guifg=#112233 gui=bold
hi ULCommandMode guibg=#2573c6 guifg=#e0e4fb gui=bold
hi ULModified guibg=#112233 guifg=#ffb11a
hi ULReadonly guibg=#112233 guifg=#F85F46 gui=bold
hi ULLanguage guibg=#2573c6 guifg=#e0e4fb
hi ULPosition guibg=#253647 guifg=#e0e4fb
hi UlLine guibg=#253647 guifg=#ffcc66
hi UlLines guibg=#253647 guifg=#3d8adb

" }}}

" components {{{
function ULGetMode()
    return "" . get(s:ul_mode_color_map, mode(), "") . "\ " . get(s:ul_mode_map, mode(), "") .  "\ %#ULDefault#"
endfunction

function ULGetFileName()
    let fname = expand("%:p")
    let wsize = winwidth("%")
    if len(fname) > wsize - 43 " this is pretty arbitrary
        return "\ %f\ "
    else
        return "\ %F\ "
    endif
endfunction

function ULGetReadonly()
    if &readonly == 1
        return "%#ULReadonly#\ [RO]%#ULDefault#"
    endif
    return ""
endfunction

function ULGetModified()
    if &modified == 1
        return "%#ULModified#\ [M]%#ULDefault#"
    endif
    return ""
endfunction

function ULGetFileInfo()
    return "%#ULDefault#[\ %#ULLanguage#" . toupper(&filetype) . "%#ULDefault#\ |\ " . &fileencoding . "\ |\ " . &fileformat . "\ ]"
endfunction

function ULGetFilePosition()
    return "%#UlPosition#%3(%c%):%#UlLine#%3(%l%)%#UlPosition#/%#UlLines#%L%#UlPosition#\ (%3(%p%)%%)"
endfunction

" }}}

" put everything together
set laststatus=2

set statusline=%{%ULGetMode()%}%{%ULGetReadonly()%}%{%ULGetModified()%}%{%ULGetFileName()%}%#Normal#
set statusline+=%=
set statusline+=%{%ULGetFileInfo()%}%#Normal#\ %{%ULGetFilePosition()%}

