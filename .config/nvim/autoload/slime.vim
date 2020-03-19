function! slime#ReplSplit(cmd) abort
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


function! slime#SendCodeBlock()
    let line1 = search('# <begin code>', 'bn') + 1
    let line2 = search('# <end code>', 'n') - 1

    execute ":" . line1 . "," . line2 . "SlimeSend"
endfunction

