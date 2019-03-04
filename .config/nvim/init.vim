"------------------------VIM PLUG--------------------------
filetype off
 
call plug#begin()

Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/vim-easy-align'
" Plug 'szymonmaszke/vimpyter'

" Plug 'goerz/jupytext.vim'

Plug 'metakirby5/codi.vim'

"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'szymonmaszke/vimpyter'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'christoomey/vim-tmux-navigator'

Plug 'itchyny/lightline.vim'

Plug 'scrooloose/nerdtree'

Plug 'morhetz/gruvbox'

Plug 'vim-syntastic/syntastic'

Plug 'xolox/vim-misc'

Plug 'xolox/vim-notes'

call plug#end()

"------------------------PLUG SETTINGS--------------------------

map <C-n> :NERDTreeToggle<CR>

let g:notes_directories = ['~/notes']

" easy align in normal and visual mode
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


"-------------------------COLORS PART-------------------------
colo gruvbox

set background=dark

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'filename'] ],
    \   'right': [ [ 'lineinfo' ] ]
    \   },
    \ }

let g:gruvbox_contrast_dark = 'medium'

set termguicolors

syntax on
syntax enable

" Enable filetype plugins
filetype plugin on 
filetype indent on 


"-------------------------LEADER PART-------------------------
let mapleader = ","

"Fast saving
nmap <leader>w :w!<cr>

"Buffer fzf navigation
noremap <leader>b :Buffers<cr>

"History fzf navigation
noremap <leader>h :History<cr>

"Ag search
noremap <leader>f :Ag<cr>

"Search word under cursor in project tree (?) using Ag
noremap <leader>d :exe ':Ag ' . expand('<cword>')<CR>


" Resize
noremap <Leader>, <C-w>3<
noremap <Leader>. <C-w>3>
inoremap <Leader>, <C-w>3<
inoremap <Leader>. <C-w>3>
noremap <Leader>< <C-w>3-
noremap <Leader>> <C-w>3+
" Quickly create a new terminal in a new tab
tnoremap <Leader>c <C-\><C-n>:tab new<CR>:term<CR>
noremap <Leader>c :tab new<CR>:term<CR>
inoremap <Leader>c <Esc>:tab new<CR>:term<CR>

" Quickly create a new terminal in a vertical split
tnoremap <Leader>\| <C-\><C-n>:vsp<CR><C-w><C-w>:term<CR>
noremap <Leader>\| :vsp<CR><C-w><C-w>:term<CR>
inoremap <Leader>\| <Esc>:vsp<CR><C-w><C-w>:term<CR>

" Quickly create a new terminal in a horizontal split
tnoremap <Leader>- <C-\><C-n>:sp<CR><C-w><C-w>:term<CR>
noremap <Leader>- :sp<CR><C-w><C-w>:term<CR>
inoremap <Leader>- <Esc>:sp<CR><C-w><C-w>:term<CR>

" Create neovim in a vertical split
tnoremap <Leader>\\ <C-\><C-n>:vsp new<CR>
noremap <Leader>\\ :vsp new<CR>
inoremap <Leader>\\ <Esc>:vsp new<CR>

" Create neovim in horizontal splits
tnoremap <Leader>_ <C-\><C-n>:sp new<CR>
noremap <Leader>_ :sp new<CR>
inoremap <Leader>_ <Esc>:sp new<CR>


"disable highlight 
map <silent> <leader><cr> :noh<cr>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"------------------------CUSTOM MAPPINGS--------------------------

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

" Go in normal mode from terminal
tnoremap jk <C-\><C-n>
inoremap jk <ESC>


"------------------------SETTINGS--------------------------


" Set to auto read when a file is changed from the outside
set autoread

" Lemme use dat scroll man
set mouse=a

" Don't be nice with vi
set nocompatible
" Set number display
set number

"Fast search
set wildmenu
set wildignore=*.o,*~,*pyc,*/.git/*,*/.hg/*,*/.svn/*

" line of history to remember 
set history=500

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
"vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
"vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>



"Nerdtree toggle

"moving between windows
"let g:tmux_navigator_no_mappings = 1
"let g:tmux_navigator_save_on_switch = 1
"
"nnoremap <silent> h :TmuxNavigateLeft<cr>
"nnoremap <silent> j :TmuxNavigateDown<cr>
"nnoremap <silent> k :TmuxNavigateUp<cr>
"nnoremap <silent> l :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>



