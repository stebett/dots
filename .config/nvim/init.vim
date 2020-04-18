call plug#begin()
Plug 'stevearc/vim-arduino'
Plug 'neovim/nvim-lsp'
Plug 'urbainvaes/vim-ripple', {'for': ['python']}
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': ['tex']}
Plug 'SirVer/ultisnips' , {'for': ['tex']}
Plug 'tpope/vim-sensible'
call plug#end()

let g:python3_host_prog="/home/ginko/.virtualenvs/nvim/bin/python3"

let mapleader=' '

let g:netrw_list_hide= '^\.'
let g:netrw_banner=0
let g:netrw_fastbrowse = 1
let g:netrw_winsize = 40
nnoremap Q :Lexplore<cr>

set termguicolors
colorscheme custom


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


set splitright
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
set autochdir
set inccommand=nosplit
set mat=2
set t_vb=
set clipboard+=unnamedplus
set grepprg=rg\ --vimgrep
set mouse=a
set wildignore=*.o,*~,*pyc,*/.git/*,*/.hg/*,*/.svn/*
set whichwrap+=<,>,h,l
set shiftwidth=4
set tabstop=4
set tags+=./.tags
set completeopt=longest,menuone,noinsert
set completeopt-=preview


" Intelligently navigate tmux panes and Vim splits using the same keys.
" See https://sunaku.github.io/tmux-select-pane.html for documentation.
let progname = substitute($VIM, '.*[/\\]', '', '')
set title titlestring=%{progname}\ %f\ +%l\ #%{tabpagenr()}.%{winnr()}
if &term =~ '^screen' && !has('nvim') | exe "set t_ts=\e]2; t_fs=\7" | endif

command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>
