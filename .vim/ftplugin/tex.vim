let g:vimtex_quickfix_mode=0

inoremap <C-l> <c-g>u<esc>[s1z=`]a<c-g>u
inoremap == <esc>o\item 
nnoremap == o\item 

nnoremap <leader>vv :VimtexView<CR>
nnoremap <leader>vc :VimtexClean<CR>
nnoremap <leader>vs :VimtexCompile<CR>

nnoremap <F10> :call screenshot#TakeScreenshot()<cr><cr>

set nonumber
setlocal spell
set spelllang=en_us,it
