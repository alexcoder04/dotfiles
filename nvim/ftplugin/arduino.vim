
" syntax {{{
inoremap ;void void (<++>){<Enter><++><Enter>}<Enter><++><Esc>3k0t(a
inoremap ;int int (<++>){<Enter><++><Enter>return <++>;<Enter>}<Enter><++><Esc>4k0t(a
inoremap ;if if (){<Enter><++><Enter>}<Enter><++><Esc>3k0t)a
inoremap ;d delay();<Enter><++><Esc>k0t)a
inoremap ;spr Serial.print();<Enter><++><Esc>k0t)a
inoremap ;spl Serial.println();<Enter><++><Esc>k0t)a
" }}}

autocmd BufWritePost *.ino !cat "%" | xclip -selection clipboard

