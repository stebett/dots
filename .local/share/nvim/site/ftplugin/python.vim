nnoremap <F5> :exec '!python' shellescape(@%, 1)<cr>

set define=^class
let g:ipythonname = "IPython"
tnoremap <Esc> <C-\><C-n>
au TermOpen * setlocal statusline=\ \ %{g:ipythonname}
au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au TermOpen * let g:neoterm_autoscroll = 1
au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert

set omnifunc=v:lua.vim.lsp.omnifunc 
lua require'nvim_lsp'.pyls.setup{}
