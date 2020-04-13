function! MyTabLine()
	let s = ''
	  for i in range(tabpagenr('$'))

		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'

		let s .= '%#MyTabLineAccent# '
	    if i + 1 == tabpagenr()
		  let s .= '%#TabLineSel# ' . (i + 1) . ' '
	    else
	      let s .= '%#TabLine# ' . (i + 1) . ' '
	    endif
		let s .= '%#MyTabLineSeparator# '
		hi MyTabLineAccent    guifg=#3c3836 guibg=#282828
		hi MyTabLineSeparator guifg=#3c3836 guibg=#282828

	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'

	return s
endfunction

hi TabLine            guifg=#bdae93 guibg=#3c3836 gui=None
hi TabLineFill        guifg=#282828 guibg=#282828
hi TabLineSel         guifg=#d3869b guibg=#3c3836 gui=None


set tabline=%!MyTabLine()
