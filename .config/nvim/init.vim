call plug#begin()

" Snippets
Plug 'SirVer/ultisnips', {'for': ['tex']}

" Latex
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': ['tex']}

" Python 
Plug 'alfredodeza/pytest.vim', {'for': ['python']}
Plug 'w0rp/ale', {'for': ['python']}
Plug 'jpalardy/vim-slime', {'for': ['python']}

" General
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-repeat' 
Plug 'tpope/vim-unimpaired' 

" Manipulation
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary' 

call plug#end()

"============================================================
""===================== Leader ==============================
"============================================================
let mapleader=' '

nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>p "+p

"============================================================
"===================== UltiSnips ============================
"============================================================

let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetDirectories=["~/.UltiSnips"]
let g:UltiSnipsEditSplit = 'vertical'

let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<c-space>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"============================================================
"===================== Nerdtree =============================
"============================================================

let NERDTreeIgnore=['.*pycache.*', '\~$']
let NERDTreeQuitOnOpen = 1
let NERDTreeStatusline=" "
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> <A-n> :NERDTreeFind<cr>

augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end


"============================================================
"===================== Easy Align ===========================
"============================================================

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"============================================================
"===================== Colors ===============================
"============================================================

set termguicolors
colo gruvbox

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

" Help 
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
set mat=2
set t_vb=
set timeoutlen=500 
set clipboard+=unnamedplus
set grepprg=rg\ --vimgrep
set mouse=a
set wildignore=*.o,*~,*pyc,*/.git/*,*/.hg/*,*/.svn/*
set whichwrap+=<,>,h,l
set shiftwidth=4
set tabstop=4
