
nnoremap <leader>p :w<CR>:!python3 "%"<CR>
nnoremap #! ggO#!/usr/bin/env<Space>python3<Esc>

" syntax {{{
inoremap ;if if :<Enter><++><Enter><Backspace><++><Esc>2k0t:a
inoremap ;ie if :<Enter><++><Enter>else:<Enter><++><Enter><Backspace><++><Esc>4k0t:a
inoremap ;ir if :<Enter><++><Enter>return<++><Enter><++><Esc>3k0t:a
inoremap ;l elif :<Enter><++><Enter><Backspace><++><Esc>2k0t:a
inoremap ;e else:<Enter><Backspace><++><Esc>kA<Enter>
inoremap ;f for in <++>:<Enter><++><Enter><Backspace><++><Esc>2k0tii<Space>
inoremap ;w while :<Enter><++><Enter><Backspace><++><Esc>2k0t:a
inoremap ;p print()<Enter><++><Esc>kt)a
inoremap ;s self.
inoremap ;d def (<++>):<Enter><++><Enter><Backspace><++><Esc>2k0t(a
inoremap ;t try :<Enter><++><Enter>except <++>Exception:<Enter><++><Enter><Backspace><++><Esc>4k0t:a
inoremap ;c class :<Enter>def __init__(self<++>):<Enter><++><Enter><Backspace><++><Enter><Backspace><++><Esc>4k0t:a
inoremap ;r return<Space>
inoremap ;im if<Space>__name__<Space>==<Space>"__main__":<Enter>
" }}}

