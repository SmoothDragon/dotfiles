" Highlight parts of line longer than 80 columns *ONLY* in Python files
    " au! BufEnter <buffer> match ColorColumn /\%81v.*/
    " autocmd! BufEnter <buffer> match /\%81v.*/
    " autocmd BufEnter <buffer> match OverLength /\%81v.\+/
    autocmd BufEnter <buffer> highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    " autocmd BufEnter <buffer> match /\%81v.\+/
    autocmd BufEnter <buffer> match OverLength /\%81v.\+/
    " autocmd BufExit match * None

" longlines file settings--------------{{{
" augroup longlines
    " autocmd!
    " autocmd FileType * match NONE
    " autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    " autocmd FileType python match OverLength /\%81v.\+/
" augroup END
" }}}
