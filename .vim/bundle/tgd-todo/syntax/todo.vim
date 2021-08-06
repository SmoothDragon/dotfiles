if exists("b:current_syntax")
    finish
endif

syntax match todoDone /^x .*/
syntax match todoPriority1 /^(1).*/
syntax match todoPriorityA /^(A).*/
syntax match todoPriorityB /^(B).*/

" highlight link todoPriority Keyword
highlight todoPriority1 ctermfg=darkgreen
highlight todoPriorityA ctermfg=red
highlight todoPriorityB ctermfg=blue
highlight todoDone cterm=underline

let b:current_syntax = "todo"
