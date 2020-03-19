"============================================================
"===================== Vim Plug =============================
"============================================================

filetype off
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
set hidden

syntax on
syntax enable

" Enable filetype plugins
filetype plugin on 
filetype indent on 

"============================================================
""===================== Leader ==============================
"============================================================
let mapleader=' '

nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>p "+p

"============================================================
"===================== Nerdtree =============================
"============================================================

let NERDTreeIgnore=['.*pycache.*', '\~$']
let NERDTreeQuitOnOpen = 1
let NERDTreeStatusline=" "
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
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
source $HOME/.config/nvim/statusline.vim

"============================================================
"===================== Mappings =============================
"============================================================

"Navigation
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


" to have help opening nicely
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>

"============================================================
"===================== Settings =============================
"============================================================

" Set number display
set number

"no swap
set noswapfile

"Right search
set ignorecase
set smartcase
set hlsearch

"Linebreak on 500 characters
set linebreak
set smartindent

"Show matching brackets
set showmatch
set mat=2

"No sounds on errors
set t_vb=
set timeoutlen=500 

" clipboard support
set clipboard+=unnamedplus

"grep
set grepprg=rg\ --vimgrep

" Lemme use dat scroll man
set mouse=a

"Fast search
set wildignore=*.o,*~,*pyc,*/.git/*,*/.hg/*,*/.svn/*

"Right backspace
set whichwrap+=<,>,h,l

" Set utf8 as standard encoding
set encoding=utf8

"Set Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set shiftwidth=4
set tabstop=4

" no tilde in blank lines
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
