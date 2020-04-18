"============================================================
"===================== Vimtex ===============================
"============================================================

setlocal spell
inoremap == <esc>o\item 
setlocal statusline=\ 
set nonumber
set spelllang=en_us,it
set conceallevel=2
let g:tex_conceal ='abdmg'
hi Conceal ctermbg=none

" to correct nicely mistakes
inoremap <C-k> <c-g>u<esc>[s1z=`]a<c-g>u
inoremap <C-b> <c-g>u<esc>[szg`]a<c-g>u


nnoremap <leader>vv :VimtexView<CR>
nnoremap <leader>vc :VimtexClean<CR>
nnoremap <leader>vs :VimtexCompile<CR>

"============================================================
"===================== Scrot ================================
"============================================================

nnoremap <F10> :call screenshot#TakeScreenshot()<cr><cr>

"============================================================
"===================== Ulitisnip ============================
"============================================================

let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode=0
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetDirectories=["~/.UltiSnips"]
let g:UltiSnipsEditSplit = 'vertical'

let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<c-space>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
