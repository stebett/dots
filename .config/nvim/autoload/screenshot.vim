function! screenshot#TakeScreenshot()
    call system('mkdir -p ~/current_course/images')
    let l:num_files = substitute(system('ls /home/ginko/current_course/images | wc -l'), '\_s*$', '', '')  
    let l:image_name = 'image' . l:num_files
    execute "!scrot -s" . ' ~/current_course/images/' . l:image_name . '.png'
    execute "normal i\\medskip\\\\\n\\includegraphics[width=\\linewidth]{./images/" . l:image_name . "}\n\\medskip\\\\"
endfunction
