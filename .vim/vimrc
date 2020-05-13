if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'urbainvaes/vim-ripple', {'for': ['python']}
Plug 'davidhalter/jedi-vim', {'for': ['python']}
Plug 'fatih/vim-go', {'for': ['go']}
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-sensible'
call plug#end()

let g:python3_host_prog="/home/ginko/.virtualenvs/nvim/bin/python3"
let g:tex_flavor = "latex"

let mapleader=' '

" let g:netrw_list_hide= '^\.'
" let g:netrw_banner=0
" let g:netrw_fastbrowse = 1
" let g:netrw_winsize = 40
" nnoremap Q :Lexplore<cr>


" set splitright
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
set mat=2
set t_vb=
set clipboard+=unnamedplus
set mouse=a
set wildignore=*.o,*~,*pyc,*/.git/*,*/.hg/*,*/.svn/*
set whichwrap+=<,>,h,l
set shiftwidth=4
set tabstop=4
set tags+=./.tags
set completeopt=longest,menuone,noinsert
set completeopt-=preview
set path=.,**
" set grepprg=rg\ --vimgrep


" Intelligently navigate tmux panes and Vim splits using the same keys.
" See https://sunaku.github.io/tmux-select-pane.html for documentation.
let progname = substitute($VIM, '.*[/\\]', '', '')
set title titlestring=%{progname}\ %f\ +%l\ #%{tabpagenr()}.%{winnr()}
if &term =~ '^screen' && !has('nvim') | exe "set t_ts=\e]2; t_fs=\7" | endif

" command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>
" command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)


" function! Grep(...)
" 	return system(join([&grepprg] + [a:1] + [expandcmd(join(a:000[1:-1], ' '))], ' '))
" endfunction
" 
" 
" cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
" 
" augroup quickfix
"     autocmd!
"     autocmd QuickFixCmdPost cgetexpr cwindow
" 	autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
" 	autocmd WinEnter * if winnr('$') == 1 && &filetype == "netrw"|q|endif
" augroup END
" 
" nnoremap <silent> [c :cprevious<cr>
" nnoremap <silent> ]c :cnext<cr>
" nnoremap <silent> [b :bprevious<cr>
" nnoremap <silent> ]b :bnext<cr>

