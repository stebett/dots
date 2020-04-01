"============================================================
"===================== Vim Slime ============================
"============================================================

let g:slime_target = 'neovim'
let g:slime_python_ipython = 1
let g:slime_paste_file = '~/.slime_paste'

nnoremap <c-c><c-s> :call slimer#ReplSplit('ipython --no-banner')<cr> 	
nnoremap <c-c><c-f> <Plug>SlimeLineSend                        	
" nnoremap <silent> <c-M> :call slimer#SendCodeBlock()<cr>              	
" inoremap jk # <begin code>
" inoremap kj # <end code>

nnoremap <F5> :exec '!python' shellescape(@%, 1)<cr>

"============================================================
"===================== Ale ==================================
"============================================================

" nnoremap <F2> :ALEFix<cr>

"============================================================
"===================== Terminal =============================
"============================================================

let g:ipythonname = "IPython"
tnoremap <Esc> <C-\><C-n>
au TermOpen * setlocal statusline=\ \ %{g:ipythonname}
au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au TermOpen * let g:neoterm_autoscroll = 1
au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert
