if !has('python3')
    echoerr "Error: tgd.vim requires +python3"
        finish
    endif

if exists('g:loaded_tgd') || &cp
    finish
endif
let g:loaded_tgd = 1

" py3file tgd_vim.py
execute "py3file ".fnameescape(fnamemodify(expand("<sfile>"), ":h")."/tgd_vim.py")  

" function AnagramCursorWord()
" python << EOF
" import vim, tgd_word

" line = vim.current.line
" (r,c) = vim.current.window.cursor
" print(' '.join(tgd_word.Anagram(CursorWord(line,c))))
" EOF
" endfunction

function DefineCursorWord()
python3 << EOF
import vim
import tgd_word

line = vim.current.line
(r,c) = vim.current.window.cursor
print(tgd_word.Define(CursorWord(line,c)))
EOF
endfunction

function ToggleTODO()
python << EOF
import vim, tgd_word

line = vim.current.line
toggle_todo_completion(line)
EOF
endfunction

" nnoremap <C-a> :python incDate()<CR>
" nnoremap <C-x> :python decDate()<CR>
