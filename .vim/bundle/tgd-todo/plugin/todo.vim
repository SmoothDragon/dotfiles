" todo.vim - A basic todo.txt manager
" Maintainer:   Tom Draper
" Version:      0.1

if !has('python3')
    echoerr "Error: todo.vim requires +python3"
        finish
    endif

if exists('g:loaded_todo') || &cp
    finish
endif
let g:loaded_todo = 1

execute "py3file ".fnameescape(fnamemodify(expand("<sfile>"), ":h:")."/todo.vim.py")

autocmd FileType todo nnoremap <buffer> <silent> <leader>x :python3 todo_toggle_completion()<CR>j
autocmd FileType todo nnoremap <buffer> <silent> <leader>n O<ESC>:python3 todo_new_date_line()<CR>A
autocmd FileType todo nnoremap <buffer> <silent> <leader>N yyp:python3 todo_clean_line()<CR>A
autocmd FileType todo nnoremap <buffer> <silent> <leader>s :python3 todo_sort()<CR>
autocmd FileType todo nnoremap <buffer> <silent> <leader>u :python3 todo_update()<CR>
autocmd FileType todo nnoremap <buffer> <silent> <C-a>     :python3 todo_modify_date(1)<CR>
autocmd FileType todo imap     <buffer> <silent> <C-a>     <C-o><C-a>
" autocmd FileType todo inoremap <buffer> <silent> <C-a>     <ESC>:python3 todo_modify_date(1)<CR>i
autocmd FileType todo nnoremap <buffer> <silent> <C-x>     :python3 todo_modify_date(-1)<CR>
autocmd FileType todo imap     <buffer> <silent> <C-x>     <C-o><C-x>
autocmd FileType todo nnoremap <buffer> <silent> <leader>a :python3 set_priority('A')<CR>
autocmd FileType todo nnoremap <buffer> <silent> <leader>b :python3 set_priority('B')<CR>
autocmd FileType todo nnoremap <buffer> <silent> <leader>c :python3 set_priority('C')<CR>
autocmd FileType todo nnoremap <buffer> <silent> <leader>A :python3 set_priority('A')<CR>
autocmd FileType todo nnoremap <buffer> <silent> <leader>B :python3 set_priority('B')<CR>
autocmd FileType todo nnoremap <buffer> <silent> <leader>C :python3 set_priority('C')<CR>
autocmd FileType todo nnoremap <buffer> <silent> <leader>r :python3 set_priority('R')<CR>
