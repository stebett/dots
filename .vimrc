"Credits to https://github.com/amix/vimrc
"Redisigned for my needs

" line of history to remember 
set history=500

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'filename'] ],
    \   'right': [ [ 'lineinfo' ] ]
    \   },
    \ }



let g:notes_directories= ['~/notes']
syntax on

" Enable filetype plugins
filetype plugin on 
filetype indent on 

" Set to auto read when a file is changed from the outside
set autoread

" Set number display
set number

let mapleader = ","

"Fast saving
nmap <leader>w :w!<cr>

"Fast search
set wildmenu
set wildignore=*.o,*~,*pyc,*/.git/*,*/.hg/*,*/.svn/*

"Show current position
set ruler

"Right backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Right search
set ignorecase
set smartcase
set hlsearch
"noremap <silent><esc> <esc>:noh<CR><esc> not working
set incsearch

"Show matching brackets
set showmatch
set mat=2

"No sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Enable syntax highlighting
syntax enable

"Enable 256 colors
colorscheme gruvbox
set t_Co=256
let g:gruvbox_contrast_dark = 'medium'
set background=dark

" Set utf8 as standard encoding
set encoding=utf8

"Set Unix as the standard file type
set ffs=unix,dos,mac

set nobackup
set nowb

" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

"Linebreak on 500 characters
set lbr
set tw=500

set ai "auto indent
set si "smart indent
set wrap "wrap lines

set laststatus=2
set noshowmode

" Visual mode pressing * or # searches for the current selection
" Idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"disable highlight 
map <silent> <leader><cr> :noh<cr>

"Nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

"moving between windows
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

nnoremap <silent> h :TmuxNavigateLeft<cr>
nnoremap <silent> j :TmuxNavigateDown<cr>
nnoremap <silent> k :TmuxNavigateUp<cr>
nnoremap <silent> l :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

"newlines
map <C-j> <ESC>o<ESC>0Dk
map <C-k> <ESC>O<ESC>0Dj

" Plugins with Vundle

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'itchyny/lightline.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'morhetz/gruvbox'

Plugin 'Syntastic'

Plugin 'xolox/vim-misc'

Plugin 'xolox/vim-notes'

Plugin 'metakirby5/codi.vim'

Plugin 'goerz/jupytext.vim'

call vundle#end()
filetype plugin indent on 


