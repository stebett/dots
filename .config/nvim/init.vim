"------------------------VIM PLUG--------------------------
filetype off
 
call plug#begin()

" Snippets

Plug 'SirVer/ultisnips'


" Latex

Plug 'lervag/vimtex'


" Python 

Plug 'alfredodeza/pytest.vim'

Plug 'w0rp/ale' "da impostare

Plug 'jpalardy/vim-slime' "da vedere se hanno aggiunto roba


" General

Plug 'tpope/vim-sensible' "cos'è?

Plug 'junegunn/goyo.vim'

Plug 'preservim/nerdtree'
" Plug 'itchyny/lightline.vim'

Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}

Plug 'tpope/vim-repeat' "per cosa lo uso?

Plug 'tpope/vim-unimpaired' "come si usa?


" Manipulation

Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-surround' "come si usa?

Plug 'tpope/vim-commentary' "comandi


" Git

Plug 'tpope/vim-fugitive' "da imparare


call plug#end()

"------------------------PLUG SETTINGS--------------------------
set hidden

syntax on
syntax enable

" Enable filetype plugins
filetype plugin on 
filetype indent on 

" Nerdtree

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

" Vimtex

autocmd FileType tex inoremap == <esc>o\item 
autocmd FileType tex setlocal spell
autocmd FileType tex VimtexCompile

let g:tex_flavor = 'latex'

" Ultisnips

let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetDirectories=["~/.UltiSnips"]
let g:UltiSnipsEditSplit = 'vertical'

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Vim-slime 

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


function! SendCodeBlock()
    let line1 = search('# <begin code>', 'bn') + 1
    let line2 = search('# <end code>', 'n') - 1

    execute ":" . line1 . "," . line2 . "SlimeSend"
endfunction


nmap <c-c><c-s> :call ReplSplit('ipython --no-banner')<cr>
nmap <c-c><c-f> <Plug>SlimeLineSend
nmap <silent> <c-M> :call SendCodeBlock()<cr>

" Easy align

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Goyo

let g:goyo_width = 900
let g:goyo_height = 400


" Ale 

let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['autopep8']}
nnoremap <F2> :ALEFix<cr>


" Scrot

function! TakeScreenshot()
    call system('mkdir -p images')
    let l:num_files = substitute(system('ls images | wc -l'), '\_s*$', '', '')  
    let l:image_name = 'image' . l:num_files
    execute "!scrot -s" . ' images/' . l:image_name . '.png'
    execute "normal i\\medskip\\\\\n\\includegraphics[width=\\linewidth]{./images/" . l:image_name . "}\n\\medskip\\\\"
endfunction

nnoremap <F10> :call TakeScreenshot()<cr><cr>

" Inkscape
"
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" Log the key usage for statistics

" au VimEnter * execute('!sudo logkeys --start --output /home/ginko/.vimkeys.log') 
" au VimLeave * execute('!sudo logkeys --kill')







"-------------------------COLORS PART-------------------------
set termguicolors
set background=dark
colo gruvbox
source $HOME/.config/nvim/statusline.vim
"

" colo gruvbox-material


" let g:lightline = {
"     \ 'colorscheme': 'gruvbox',
"     \ 'active': {
"     \   'left': [ [ 'mode', 'paste' ],
"     \             [ 'filename'] ],
"     \   'right': [ [ 'lineinfo' ] ]
"     \   },
"     \ }



"-------------------------LEADER PART-------------------------
let mapleader = " "


".def.h settings
nnoremap <leader>sk :!sudo rm config.h && make && sudo make clean install<cr>

nnoremap <leader>db oimport pdb; pdb.set_trace()<esc>

noremap <leader>g :Goyo<cr>

"Fast saving
nmap <leader>w :w!<cr>

"Fast go out from open panes
nmap <leader>q :q<cr>


" Copy to clipboard
nnoremap  <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"------------------------CUSTOM MAPPINGS--------------------------

" to correct nicely mistakes

inoremap <C-k> <c-g>u<esc>[s1z=`]a<c-g>u

" to have help opening nicely
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>

nnoremap <F5> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <F4> :Pytest file<cr>
nnoremap <F6> :Pytest file --pdb<cr>

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

" terminal settings 
" Go in normal mode from terminal
let g:ipythonname = "IPython"
tnoremap <Esc> <C-\><C-n>
au TermOpen * setlocal statusline=\ \ %{g:ipythonname}
au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au TermOpen * let g:neoterm_autoscroll = 1
au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert


"------------------------SETTINGS--------------------------

let g:python3_host_prog='/home/ginko/.virtualenvs/env/bin/python3'
" let g:c_syntax_for_h = 1

"no swap
set noswapfile

" no tilde in blank lines
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

"grep
set grepprg=rg\ --vimgrep

" Spellcheck
set spelllang=en_us,it

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
set tm=500 " timeout lenght, how much to wait

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
set linebreak
set textwidth=0

set smartindent
set wrap "wrap lines

set noshowmode

