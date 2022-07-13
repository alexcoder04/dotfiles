
" spell-checking
setlocal spell spelllang=de
setlocal tw=80
nnoremap <leader>p :w<CR>:!latex-build "%"<CR>

" commands {{{
inoremap ;1 \section{}<Enter><++><Esc>k0f{a
inoremap ;2 \subsection{}<Enter><++><Esc>k0f{a
inoremap ;3 \subsubsection{}<Enter><++><Esc>k0f{a
inoremap ;4 \subsubsubsection{}<Enter><++><Esc>k0f{a

inoremap ;i \textit{}<Space><++><Esc>F{a
inoremap ;b \textbf{}<Space><++><Esc>F{a
inoremap ;u \underline{}<Space><++><Esc>F{a

inoremap ;ul \begin{itemize}<Enter>\item<Space><Enter>\end{itemize}<Esc>kA
inoremap ;ol \begin{enumerate}<Enter>\item<Space><Enter>\end{enumerate}<Esc>kA
inoremap ;l <Enter>\item<Space>

inoremap ;. \cdot<Space>
inoremap ;sq \sqrt{}<Space><++><Esc>F{a
inoremap ;f \frac{}{<++>}<Space><++><Esc>F{F{a
inoremap ;$ $$<Space><++><Esc>F$i
inoremap ;D \Delta<Space>

inoremap ;! <Esc>:r $HOME/Documents/Templates/latex/default.tex<Enter>
nnoremap <leader>e yyI\begin{<Esc>A}<Esc>pI\end{<Esc>A}<Esc>O
imap ;e <Esc>b<leader>e
nnoremap <leader>m i\begin{mdframed}[linecolor=red]<Enter>\end{mdframed}<Esc>O
inoremap ;us \usepackage{}<Esc>i
" }}}

