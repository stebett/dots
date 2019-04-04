"------------------------VIM PLUG--------------------------
filetype off
 
call plug#begin()

Plug 'junegunn/goyo.vim'
Plug 'jpalardy/vim-slime'

"Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/vim-easy-align'

"Plug 'metakirby5/codi.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Plug 'autozimu/LanguageClient-neovim', {
 "            \ 'branch': 'next',
  "           \ 'do': 'bash install.sh',
   "          \ }

" Plug 'klen/python-mode'

Plug 'majutsushi/tagbar'

Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdcommenter'

" Plug 'neomake/neomake'

Plug 'yuttie/comfortable-motion.vim'

Plug 'tpope/vim-fugitive'

Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-bufword'
Plug 'roxma/nvim-yarp'

Plug 'alfredodeza/pytest.vim'
Plug 'plytophogy/vim-virtualenv'
"Plug 'ervandew/supertab'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deoplete-plugins/deoplete-jedi'

" Plug 'Shougo/echodoc.vim'

Plug 'itchyny/lightline.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'morhetz/gruvbox'

Plug 'w0rp/ale'

Plug 'vim-pandoc/vim-pandoc' 

Plug 'vim-pandoc/vim-pandoc-syntax' " change with next
"Plug 'godlygeek/tabular' "Required for markdown
"Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

call plug#end()

"------------------------PLUG SETTINGS--------------------------
set hidden

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

nmap <c-c><c-s> :call ReplSplit('ipython')<cr>

nmap <c-c><c-f> <Plug>SlimeLineSend

nmap <F8> :TagbarToggle<CR>

" easy align in normal and visual mode
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" au BufRead,BufNewFile *.md 
let g:goyo_width = 900
let g:goyo_height = 400

" ncm2 options

autocmd BufRead,BufNewFile,BufEnter *.py call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c

inoremap <c-c> <ESC>

let g:ncm2#auto_popup = 0
inoremap <silent> <S-tab> <c-r>=ncm2#manual_trigger()<cr>
let g:ncm2#total_popup_limit = 10
inoremap <expr><A-n> pumvisible() ? "\<C-n>" : "\<A-n>"
inoremap <expr><A-p> pumvisible() ? "\<C-p>" : "\<A-p>"

"Ale Options

let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['autopep8']}
nnoremap <F2> :ALEFix<cr>

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

syntax on
syntax enable

" Enable filetype plugins
filetype plugin on 
filetype indent on 


"-------------------------LEADER PART-------------------------
let mapleader = " "

nnoremap <leader>db oimport pdb; pdb.set_trace()<esc>
nmap <leader><leader> :Ranger<CR>

"Fast saving
nmap <leader>w :w!<cr>

"Fast go out from open panes
nmap <leader>q :q<cr>

"Buffer fzf navigation
noremap <leader>sb :Buffers<cr>

"History fzf navigation
noremap <leader>sh :History<cr>

"Rg word search in current di
"noremap <leader>sw :Rg<cr>

noremap <leader>g :Goyo<cr>

"fzf search
noremap <leader>sf :Files ~<cr>

"Search word under cursor in project tree (?) using Ag
noremap <leader>sw :exe ':Rg ' . expand('<cword>')<CR>


" Resize
noremap <Leader>h <C-w>5<
noremap <Leader>l <C-w>5>
noremap <Leader>k <C-w>5-
noremap <Leader>j <C-w>5+
" Quickly create a new terminal in a new tab
" tnoremap <Leader>c <C-\><C-n>:tab new<CR>:term<CR>
" noremap <Leader>c :tab new<CR>:term<CR>
" inoremap <Leader>c <Esc>:tab new<CR>:term<CR>

" Quickly create a new terminal in a vertical split
"tnoremap <Leader>\| <C-\><C-n>:vsp<CR><C-w><C-w>:term<CR>
nnoremap <Leader>\| :vsp<CR><C-w><C-w>:term<CR>

" Quickly create a new terminal in a horizontal split
"tnoremap <Leader>- <C-\><C-n>:sp<CR><C-w><C-w>:term<CR>
noremap <Leader>- :sp<CR><C-w><C-w>:term<CR>

" Create neovim in a vertical split with ranger
"tnoremap <Leader>\\ <C-\><C-n>:vsp new<CR>:Ranger<CR>
"nnoremap <Leader>\\ :vsp new<CR>:Ranger<CR>

" Create neovim in horizontal splits with ranger
"tnoremap <Leader>_ <C-\><C-n>:sp new<CR>:Ranger<CR>
"nnoremap <Leader>_ :sp new<CR>:Ranger<CR>


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



" Go in normal mode from terminal
tnoremap <Esc> <C-\><C-n>



au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au TermOpen * let g:neoterm_autoscroll = 1
au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert

"make your md file pdf with his own name
function ToPdf()
    let workfile = bufname('%')
    let workfile2 = substitute(workfile, 'md', 'pdf', '')
    exe 'w'
    exe '!' . 'pandoc -V geometry:margin=.6in --pdf-engine=pdflatex $HOME/Documents/notes/metadata.yaml "%" -o ' . "$HOME/Documents/notes/Appunti/pdf/'" . workfile2 . "'"
endfunction

nnoremap <F10> :call ToPdf()<cr><cr>

"------------------------SETTINGS--------------------------
"no swap
set noswapfile

"grep
set grepprg=rg\ --vimgrep

" Spellcheck
set spelllang=en_us,it_it

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




"moving between windows
"let g:tmux_navigator_no_mappings = 1
"let g:tmux_navigator_save_on_switch = 1
"
"nnoremap <silent> h :TmuxNavigateLeft<cr>
"nnoremap <silent> j :TmuxNavigateDown<cr>
"nnoremap <silent> k :TmuxNavigateUp<cr>
"nnoremap <silent> l :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>


"Deoplete options

"Source

"Enable only on .py files
"au BufRead,BufNewFile *.py call deoplete#enable()

"" Autoclose snippets at top
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"" Don't autocomplete, max list lenght=10
"call deoplete#custom#buffer_option('auto_complete', v:false)
"call deoplete#custom#option('max_list', 10)
"let g:deoplete#sources = {}
"call deoplete#custom#source('_',
            "\ 'disabled_syntaxes', ['Comments', 'String'])
"call deoplete#custom#option('sources', {
            "\ 'python': ['jedi'],
            "\ })

"" Manual completion (copy-pasted from :help deoplete)
"inoremap <silent><expr> <TAB>
"\ pumvisible() ? "\<C-n>" :
"\ <SID>check_back_space() ? "\<TAB>" :
"\ deoplete#mappings#manual_complete()
"function! s:check_back_space() abort "{{{
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}


" Python Mode Settings

"let g:pymode_rope_completion_bind = '<Tab>'
"let g:pymode_rope_complete_on_dot = 0

"let g:pymode_rope_goto_definition_bind = '<Leader>sd'
"let g:pymode_rope_rename_bind = '<Leader>dw'

"let g:pymode_syntax_indent_errors = 0
"let g:pymode_syntax_space_errors = 0
"let g:pymode_options_colorcolumn = 0

"let g:python3_host_prog = '/home/ginko/.virtualenvs/env/bin/python3'
