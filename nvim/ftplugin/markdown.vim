
nnoremap <leader>P :w<CR>:!md-preview -i "%" -e<CR>
nnoremap <leader>p :w<CR>:!md-preview -i "%"<CR>
nnoremap <leader>tm :TableModeToggle<CR>

" syntax {{{
inoremap ;1 #<Enter><++><Esc>kA<Space>
inoremap ;2 ##<Enter><++><Esc>kA<Space>
inoremap ;3 ###<Enter><++><Esc>kA<Space>
inoremap ;i ** <++><Esc>F*i
inoremap ;b **** <++><Esc>F*hi
inoremap ;` ```<Enter><++><Enter>```<Enter><++><Esc>3kA
inoremap ;l <Enter><Esc>I<Space>-<Space>
" }}}

