call plug#begin()

" Python 
Plug 'urbainvaes/vim-ripple', {'for': ['python']}
Plug 'alfredodeza/pytest.vim', {'for': ['python']}
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
Plug 'tpope/vim-fugitive'
" Manipulation
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary' 

call plug#end()

filetype plugin on       

set omnifunc=python3complete#Complete
"============================================================
""===================== Leader ==============================
"============================================================
let mapleader=' '

nnoremap <leader>vv :VimtexView<CR>
nnoremap <leader>vc :VimtexClean<CR>
nnoremap <leader>vs :VimtexCompile<CR>

"============================================================
"===================== UltiSnips ============================
"============================================================
let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode=0
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
let g:netrw_banner=0
let g:netrw_fastbrowse = 1
let g:netrw_winsize = 40


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

" Intelligently navigate tmux panes and Vim splits using the same keys.
" See https://sunaku.github.io/tmux-select-pane.html for documentation.
let progname = substitute($VIM, '.*[/\\]', '', '')
set title titlestring=%{progname}\ %f\ +%l\ #%{tabpagenr()}.%{winnr()}
if &term =~ '^screen' && !has('nvim') | exe "set t_ts=\e]2; t_fs=\7" | endif
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

nnoremap Zb :Buffers<cr>
nnoremap Zl :Lines<cr>
nnoremap Zf :Files<cr>
nnoremap Zh :History<cr>
nnoremap Zm :Marks<cr>
nnoremap Zr :Rg<cr>


nnoremap Zp "+p
nnoremap Q :Lexplore<cr>

command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>
"============================================================
"===================== Settings =============================
"============================================================

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
set laststatus=2
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
set completeopt=longest,menuone
