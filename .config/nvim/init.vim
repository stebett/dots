"============================================================
"===================== Vim Plug =============================
"============================================================

filetype off
call plug#begin()

" Snippets
Plug 'SirVer/ultisnips', {'for': ['tex']}

" Latex
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'KeitaNakamura/tex-conceal.vim'

" Python 
Plug 'alfredodeza/pytest.vim', {'for': ['python']}
Plug 'w0rp/ale', {'for': ['python']}
Plug 'jpalardy/vim-slime', {'for': ['python']}

" General
Plug 'tpope/vim-sensible'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-repeat' 
Plug 'tpope/vim-unimpaired' 

" Manipulation
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary' 

" Git
Plug 'tpope/vim-fugitive' 


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
"===================== Vimtex ===============================
"============================================================

autocmd FileType tex inoremap == <esc>o\item 

" Spellcheck
set spelllang=en_us,it

autocmd FileType tex setlocal spell
autocmd FileType tex setlocal statusline=\ 
autocmd FileType tex set nonumber

let g:tex_flavor = 'latex'
set conceallevel=2
let g:tex_conceal ='abdmg'
hi Conceal ctermbg=none

"============================================================
"===================== Ulitisnip ============================
"============================================================

let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetDirectories=["~/.UltiSnips"]
let g:UltiSnipsEditSplit = 'vertical'

let g:UltiSnipsExpandTrigger = "<c-space>"
" let g:UltiSnipsJumpForwardTrigger = "<c-space>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"============================================================
"===================== Vim Slime ============================
"============================================================

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


augroup vimslime
	au!
	au filetype python nnoremap <c-c><c-s> :call ReplSplit('ipython --no-banner')<cr> 	
	au filetype python nnoremap <c-c><c-f> <Plug>SlimeLineSend                        	
	au filetype python nnoremap <silent> <c-M> :call SendCodeBlock()<cr>              	
	au filetype python inoremap jk # <begin code>
	au filetype python inoremap kj # <end code>
augroup end






"============================================================
"===================== Easy Align ===========================
"============================================================

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"============================================================
"===================== Goyo =================================
"============================================================

nnoremap <leader>g :Goyo<cr>

let g:goyo_width = 900
let g:goyo_height = 400


"============================================================
"===================== Ale ==================================
"============================================================

nnoremap <F2> :ALEFix<cr>

let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['autopep8']}

"============================================================
"===================== Scrot ================================
"============================================================

nnoremap <F10> :call TakeScreenshot()<cr><cr>

function! TakeScreenshot()
    call system('mkdir -p ~/current_course/images')
    let l:num_files = substitute(system('ls /home/ginko/current_course/images | wc -l'), '\_s*$', '', '')  
    let l:image_name = 'image' . l:num_files
    execute "!scrot -s" . ' ~/current_course/images/' . l:image_name . '.png'
    execute "normal i\\medskip\\\\\n\\includegraphics[width=\\linewidth]{./images/" . l:image_name . "}\n\\medskip\\\\"
endfunction

"============================================================
"===================== Floating Term ========================
"============================================================

nnoremap <silent> <leader><cr> :call FloatTerm()<cr>

let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

"============================================================
"===================== Colors ===============================
"============================================================

set termguicolors
set background=dark
colo gruvbox
source $HOME/.config/nvim/statusline.vim

"============================================================
"===================== Mappings =============================
"============================================================

" to correct nicely mistakes
inoremap <C-k> <c-g>u<esc>[s1z=`]a<c-g>u

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

" to have help opening nicely
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>

"============================================================
"===================== Terminal =============================
"============================================================

let g:ipythonname = "IPython"
tnoremap <Esc> <C-\><C-n>
au TermOpen * setlocal statusline=\ \ %{g:ipythonname}
au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au TermOpen * let g:neoterm_autoscroll = 1
au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert

"============================================================
"===================== Settings =============================
"============================================================

" clipboard support
set clipboard+=unnamedplus

"no swap
set noswapfile

"grep
set grepprg=rg\ --vimgrep

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
set shiftwidth=4
set tabstop=4

"Linebreak on 500 characters
set linebreak
set textwidth=0
set smartindent

"wrap lines
set wrap 
set noshowmode

" no tilde in blank lines
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
