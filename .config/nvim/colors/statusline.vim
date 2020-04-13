function! RedrawModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi MyStatuslineAccent  guifg=#3c3836 gui=bold
    hi MyStatuslineFilename guifg=#bdae93 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#bdae93  guibg=#3c3836     
  " Insert mode
  elseif a:mode == 'i'
    hi MyStatuslineAccent  guifg=#3c3836 
    hi MyStatuslineFilename guifg=#83a598 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#83a598  guibg=#3c3836    
  " Replace mode
  elseif a:mode == 'R'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#fb4934 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#fb4934  guibg=#3c3836    
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#d65d0e guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#d65d0e  guibg=#3c3836    
  " Command mode
  elseif a:mode == 'c'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#d79921 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#d79921  guibg=#3c3836    
  " Terminal mode
  elseif a:mode == 't'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#98971a guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#98971a  guibg=#3c3836    
  endif
  " Return empty string so as not to display anything in the statusline
  return ''
endfunction
" }}}
function! SetModifiedSymbol(modified) " {{{
    if a:modified == 1
        hi MyStatuslineModifiedBody guifg=#d79921 guibg=#3c3836
    else
        hi MyStatuslineModifiedBody guifg=#928374 guibg=#3c3836
    endif
    return '●'
endfunction
" }}}
function! SetFiletype(filetype) " {{{
  if a:filetype == ''
      return '-'
  else
      return a:filetype
  endif
endfunction
" }}}
" Statusline ------------------------------------------------------------------ 
set statusline=%{RedrawModeColors(mode())}
" Left side items
" =======================
set statusline+=%#MyStatuslineAccent#\ 
set statusline+=%#MyStatuslineAccentBody#●\ 
" Filename
set statusline+=%#MyStatuslineFilename#%t
set statusline+=%#MyStatuslineSeparator#\ 
" Right side items
" =======================
set statusline+=%=
" Line and Column
set statusline+=%#MyStatuslineLineCol#
set statusline+=%#MyStatuslineLineColBody#%2l
set statusline+=\/%#MyStatuslineLineColBody#%2c
set statusline+=%#MyStatuslineLineCol#
" Padding
set statusline+=\ 
" Current scroll percentage and total lines of the file
set statusline+=%#MyStatuslinePercentage#
set statusline+=%#MyStatuslinePercentageBody#%P
set statusline+=\/\%#MyStatuslinePercentageBody#%L
set statusline+=%#MyStatuslinePercentage#
" Padding
set statusline+=\ 
" Filetype
set statusline+=%#MyStatuslineFiletype#
set statusline+=%#MyStatuslineFiletypeBody#%{SetFiletype(&filetype)}
set statusline+=%#MyStatuslineFiletype#\ 

hi StatusLine            guifg=#282828 guibg=#98971a
hi StatusLineNC          guifg=#282828 guibg=#98971a
hi mystatuslineseparator guifg=#3c3836 guibg=None
hi MyStatuslineModified  guifg=#3c3836 guibg=None
hi MyStatuslineFiletype  guifg=#3c3836 guibg=None

hi MyStatuslineFiletypeBody   ctermfg=5     cterm=italic ctermbg=0    guifg=#689d6a guibg=#3c3836 gui=italic
hi MyStatuslinePercentageBody guifg=#d65d0e guibg=#3c3836
hi MyStatuslinePercentage     guibg=None    guifg=#3c3836
hi MyStatuslineLineCol        ctermfg=0     cterm=NONE   ctermbg=NONE guifg=#3c3836 guibg=None
hi MyStatuslineLineColBody    ctermbg=0     cterm=none   ctermfg=2    guifg=#458588 guibg=#3c3836


