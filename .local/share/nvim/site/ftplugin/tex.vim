"============================================================
"===================== Vimtex ===============================
"============================================================

setlocal spell
inoremap == <esc>o\item 
setlocal statusline=\ 
set nonumber
set spelllang=it,en_us
let g:tex_flavor = 'latex'
set conceallevel=2
let g:tex_conceal ='abdmg'
hi Conceal ctermbg=none

" to correct nicely mistakes
inoremap <C-k> <c-g>u<esc>[s1z=`]a<c-g>u
inoremap <C-b> <c-g>u<esc>[szg`]a<c-g>u


"============================================================
"===================== Scrot ================================
"============================================================

nnoremap <F10> :call screenshot#TakeScreenshot()<cr><cr>

"============================================================
"===================== Ulitisnip ============================
"============================================================

let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetDirectories=["~/.UltiSnips"]
let g:UltiSnipsEditSplit = 'vertical'

let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<c-space>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" Accents
inoremap `a <C-v>224
inoremap ,a <C-v>225
inoremap `e <C-v>232
inoremap ,e <C-v>233
inoremap `i <C-v>236
inoremap ,i <C-v>237
inoremap `o <C-v>242
inoremap ,o <C-v>243
inoremap `u <C-v>249
inoremap ,u <C-v>250
inoremap `E <C-v>200
