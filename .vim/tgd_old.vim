if !has('python')
    s:ErrMsg( "Error: Required vim compiled with +python" )
        finish
    endif

if exists("loaded_tgd")
    finish
endif
let loaded_tgd=1

"pyfile tgd_vim.py
execute "pyfile ".fnameescape(fnamemodify(expand("<sfile>"), ":h")."/tgd_vim.py")  

" Identify what word is under the cursor in vim.
function CursorWord()
python << EOF
import vim, tgd_vim
line = vim.current.line
(r,c) = vim.current.window.cursor
print tgd_vim.CursorWord(line,c)
EOF
endfunction

function AnagramCursorWord()
python << EOF
import vim, tgd_word
line = vim.current.line
(r,c) = vim.current.window.cursor
for word in tgd_word.Anagram(CursorWord(line,c)):
    print word,
EOF
endfunction

