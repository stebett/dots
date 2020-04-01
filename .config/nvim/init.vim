call plug#begin()

" Python 
Plug 'alfredodeza/pytest.vim', {'for': ['python']}
Plug 'jpalardy/vim-slime', {'for': ['python']}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['python']}


" Latex
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': ['tex']}
" Snippets
Plug 'SirVer/ultisnips' , {'for': ['tex']}


" General
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat' 
Plug 'tpope/vim-unimpaired' 
Plug 'junegunn/fzf.vim'
" Manipulation
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary' 

call plug#end()

filetype plugin on          " netrw

"============================================================
""===================== Leader ==============================
"============================================================
let mapleader=' '

"============================================================
"===================== UltiSnips ============================
"============================================================
let g:tex_flavor = "latex"
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetDirectories=["~/.UltiSnips"]
let g:UltiSnipsEditSplit = 'vertical'

let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<c-space>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"============================================================
"===================== Netrw =============================
"============================================================

let g:netrw_list_hide= '^\.'
let g:netrw_menu=0
let g:netrw_preview=1

"============================================================
"========================== Coc =============================
"============================================================

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
 
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

"============================================================
"===================== Easy Align ===========================
"============================================================

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"============================================================
"===================== Colors ===============================
"============================================================

set termguicolors
colorscheme custom
"============================================================
"===================== Mappings =============================
"============================================================

" Navigation
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l
inoremap <A-h> <Esc><C-w>h
inoremap <A-j> <Esc><C-w>j
inoremap <A-k> <Esc><C-w>k
inoremap <A-l> <Esc><C-w>l

nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap ]t gt
nnoremap [t gT
nnoremap <silent><C-w>t :tabnew<cr>

nnoremap Zb :Buffers<cr>
nnoremap Zl :Lines<cr>
nnoremap Zf :Files<cr>
nnoremap Zh :History<cr>
nnoremap Zm :Marks<cr>
nnoremap Zr :Rg<cr>



" nnoremap Zq :call helpers#quit()<cr>

nnoremap Zp "+p
nnoremap Q :Explore<cr>

command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>
"============================================================
"===================== Settings =============================
"============================================================

set hidden
set number
set noswapfile 
set ignorecase
set smartcase
set hlsearch
set linebreak
set smartindent
set showmatch
set noshowmode
set laststatus=2
set inccommand=nosplit
set mat=2
set t_vb=
" set timeoutlen=1000 
set clipboard+=unnamedplus
set grepprg=rg\ --vimgrep
set mouse=a
set wildignore=*.o,*~,*pyc,*/.git/*,*/.hg/*,*/.svn/*
set whichwrap+=<,>,h,l
set shiftwidth=4
set tabstop=4
