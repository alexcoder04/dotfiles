"        _                        _            ___  _  _   
"   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
"  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
" | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
"  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
" 
" Copyright (c) 2021 alexcoder04 <https://github.com/alexcoder04>
" 
" snippets for different file types in nvim

" -------------------------------------------------
" AUTO-INSERT OFTEN USED PHRASES
" -------------------------------------------------
" html tags
autocmd FileType html inoremap ;! i<!DOCTYPE html><Enter><html<Space>dir="ltr"><Enter><head><Enter><meta<Space>charset="utf-8"<Space>/><Enter><meta<Space>name="viewport"<Space>content="width=device-width,<Space>initial-scale=1.0"><Enter><title><++></title><Enter><++><Enter></head><Enter><body><Enter><++><Enter></body><Enter></html><Esc>gg/<++><CR>"_c4l
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
autocmd FileType markdown inoremap ;1 #<Enter><++><Esc>kA<Space>
autocmd FileType markdown inoremap ;2 ##<Enter><++><Esc>kA<Space>
autocmd FileType markdown inoremap ;3 ###<Enter><++><Esc>kA<Space>
autocmd FileType markdown inoremap ;i ** <++><Esc>F*i
autocmd FileType markdown inoremap ;b **** <++><Esc>F*hi
autocmd FileType markdown inoremap ;` ```<Enter><++><Enter>```<Enter><++><Esc>3kA
autocmd FileType markdown inoremap ;l <Enter><Esc>I<Space>-<Space>

" LaTeX
autocmd FileType tex inoremap ;1 \section{}<Enter><++><Esc>k0f{a
autocmd FileType tex inoremap ;2 \subsection{}<Enter><++><Esc>k0f{a
autocmd FileType tex inoremap ;3 \subsubsection{}<Enter><++><Esc>k0f{a
autocmd FileType tex inoremap ;4 \subsubsubsection{}<Enter><++><Esc>k0f{a

autocmd FileType tex inoremap ;i \textit{}<Space><++><Esc>F{a
autocmd FileType tex inoremap ;b \textbf{}<Space><++><Esc>F{a
autocmd FileType tex inoremap ;u \underline{}<Space><++><Esc>F{a

autocmd FileType tex inoremap ;ul \begin{itemize}<Enter>\item<Space><Enter>\end{itemize}<Esc>kA
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter>\item<Space><Enter>\end{enumerate}<Esc>kA
autocmd FileType tex inoremap ;l <Enter>\item<Space>

autocmd FileType tex inoremap ;. \cdot<Space>
autocmd FileType tex inoremap ;sq \sqrt{}<Space><++><Esc>F{a
autocmd FileType tex inoremap ;f \frac{}{<++>}<Space><++><Esc>F{F{a
autocmd FileType tex inoremap ;$ $$<Space><++><Esc>F$i
autocmd FileType tex inoremap ;D \Delta<Space>

autocmd FileType tex inoremap ;! <Esc>:r $HOME/Documents/Templates/latex/default.tex<Enter>
autocmd FileType tex nnoremap <leader>e yyI\begin{<Esc>A}<Esc>pI\end{<Esc>A}<Esc>O
autocmd FileType tex imap ;e <Esc>b<leader>e
autocmd FileType tex nnoremap <leader>m i\begin{mdframed}[linecolor=red]<Enter>\end{mdframed}<Esc>O
autocmd FileType tex inoremap ;us \usepackage{}<Esc>i

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

