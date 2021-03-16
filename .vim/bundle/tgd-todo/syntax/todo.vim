if exists("b:current_syntax")
    finish
endif

syntax match todoDone /^x .*/
syntax match todoPriorityA /^(A.*/
syntax match todoPriorityB /^(B.*/

" highlight link todoPriority Keyword
highlight todoPriorityA ctermfg=red
highlight todoPriorityB ctermfg=blue
highlight todoDone cterm=underline

let b:current_syntax = "todo"
