"------------------------VIM PLUG--------------------------
filetype off
 
call plug#begin()

" Python 
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-bufword'
Plug 'roxma/nvim-yarp'

Plug 'alfredodeza/pytest.vim'

Plug 'w0rp/ale'

Plug 'plytophogy/vim-virtualenv'

Plug 'jpalardy/vim-slime'

Plug 'majutsushi/tagbar'

Plug 'neomake/neomake'

" Markdown

Plug 'vim-pandoc/vim-pandoc' 

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" General
Plug 'tpope/vim-sensible'

Plug 'junegunn/goyo.vim'

Plug 'itchyny/lightline.vim'

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-unimpaired'

"Plug 'ervandew/supertab'

" Manipulation

Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

" Git
Plug 'tpope/vim-fugitive'

" Navigation

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'yuttie/comfortable-motion.vim'

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'



call plug#end()

"------------------------PLUG SETTINGS--------------------------
set hidden

syntax on
syntax enable

" Enable filetype plugins
filetype plugin on 
filetype indent on 

" vim-slime 

function! ReplSplit(cmd) abort
    " Split window nicely and open a terminal.
    vsplit
    " Spawn shell.
    " `terminal` will put you in insert mode, so don't use it.
    execute 'normal!' . "\<c-w>p"
    enew | call termopen(a:cmd)
    let l:repl_job_id = b:terminal_job_id
    " Go to previous split.
    " let buffer's REPL be the one we just entered.
    execute 'normal!' . "\<c-w>p"
    stopinsert
    let b:slime_config = {'jobid': l:repl_job_id}
endfunction

let g:slime_target = 'neovim'
let g:slime_python_ipython = 1
let g:slime_paste_file = '~/.slime_paste'

nmap <c-c><c-s> :call ReplSplit('ipython --no-banner')<cr>

nmap <c-c><c-f> <Plug>SlimeLineSend

" tagbar
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let tagbar_show_visibility = 0
let g:tagbar_iconchars = ['▸', '▾']

function TagColor()
    hi TagbarScope     guifg=#fb4934 "Class name
    hi TagbarType      guifg=#8ec07c "member/class/function
    hi TagbarFoldIcon  guifg=#d5c4a1 "arrow
    hi TagbarHighlight guifg=#fabd2f "hightlight, bg with guibg
endfunction
" hi TagbarSignature guifg = "self, ecc
nmap <F8> :TagbarToggle<CR> :call TagColor()<Cr>

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" goyo
let g:goyo_width = 900
let g:goyo_height = 400

" ncm2

autocmd BufRead,BufNewFile,BufEnter *.py call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c

inoremap <c-c> <ESC>

let g:ncm2#auto_popup = 0
inoremap <silent> <S-tab> <c-r>=ncm2#manual_trigger()<cr>
let g:ncm2#total_popup_limit = 10
inoremap <expr><A-n> pumvisible() ? "\<C-n>" : "\<A-n>"
inoremap <expr><A-p> pumvisible() ? "\<C-p>" : "\<A-p>"

"Ale 

let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['autopep8']}
nnoremap <F2> :ALEFix<cr>

"ranger
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

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



"-------------------------LEADER PART-------------------------
let mapleader = " "

".def.h settings
nnoremap <leader>sk :!sudo rm config.h && make && sudo make clean install<cr>

nnoremap <leader>db oimport pdb; pdb.set_trace()<esc>

map <leader><leader> :Ranger<CR>

noremap <leader>g :Goyo<cr>

"Fast saving
nmap <leader>w :w!<cr>

"Fast go out from open panes
nmap <leader>q :q<cr>

"Buffer fzf navigation
noremap <leader>sb :Buffers<cr>

"History fzf navigation
noremap <leader>sh :History<cr>

"change leader s to ctrl s
"fzf search
noremap <leader>sf :Files ~<cr>

"Search word under cursor in project tree (?) using Ag
noremap <leader>sw :exe ':Rg ' . expand('<cword>')<CR>


" find normal mappings
" Resize
noremap <Leader>h <C-w>5<
noremap <Leader>l <C-w>5>
noremap <Leader>k <C-w>5-
noremap <Leader>j <C-w>5+

" Copy to clipboard
nnoremap  <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"------------------------CUSTOM MAPPINGS--------------------------

" to have help opening nicely
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>

nnoremap <F5> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <F4> :Pytest file<cr>
nnoremap <F6> :Pytest file --pdb<cr>
nnoremap <F7> :

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

" Accents
inoremap `a <C-v>224
inoremap ``a <C-v>225
inoremap `e <C-v>232
inoremap ``e <C-v>233
inoremap `i <C-v>236
inoremap ``i <C-v>237
inoremap `o <C-v>242
inoremap ``o <C-v>243
inoremap `u <C-v>249
inoremap ``u <C-v>250

inoremap `E <C-v>200


" terminal settings 
" Go in normal mode from terminal
tnoremap <Esc> <C-\><C-n>

au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au TermOpen * let g:neoterm_autoscroll = 1
au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert

"md settings 
"make your md file pdf with his own name
function ToPdf()
    let workfile = bufname('%')
    let workfile2 = substitute(workfile, 'md', 'pdf', '')
    exe 'w'
    exe '!' . 'pandoc -V geometry:margin=.6in --pdf-engine=pdflatex $HOME/Documents/Notes/metadata.yaml "%" -o ' . "$HOME/Books/pdf/'" . workfile2 . "'"
endfunction

nnoremap <F10> :call ToPdf()<cr><cr>


"------------------------SETTINGS--------------------------
"no swap
set noswapfile

" no tilde in blank lines
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

"grep
set grepprg=rg\ --vimgrep

" Spellcheck
set spelllang=en_us,it_it

" Lemme use dat scroll man
set mouse=a

" Don't be nice with vi
set nocompatible

" Set number display
set number

"Fast search
set wildignore=*.o,*~,*pyc,*/.git/*,*/.hg/*,*/.svn/*

"Right backspace
set whichwrap+=<,>,h,l

"Right search
set ignorecase
set smartcase
set hlsearch

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
set shiftwidth=4
set tabstop=4

"Linebreak on 500 characters
set lbr
set tw=500

set si "smart indent
set wrap "wrap lines

set noshowmode

