" .vimrc by Thomas Draper
" General settings (must come first)----------{{{
set nocompatible
" PATHOGEN loads scripts in .vim/bundle directory
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
" }}}
" VIM CUSTOMIZATION -----------------{{{
" Change mapleader from \ to ,
let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader>v :vsplit $MYVIMRC<cr> " edit my .vimrc file in a vertical split
nnoremap <leader>s :split $MYVIMRC<cr>  " edit my .vimrc file in a split
nnoremap <leader>e :edit $MYVIMRC<cr>   " edit my .vimrc file
nnoremap <leader>u :source $MYVIMRC<cr> " update the system settings from my vimrc file
augroup reload_vimrc " Automatically source .vimrc upon saving
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
" }}}
" Key Bindings-----------------------{{{
" Enter Normal mode using jj typed quickly
:inoremap jj <esc>
" Do colon commands with semicolon
map ; :
noremap ;; ;
" Permanently disable ex mode
nnoremap Q <nop>
" unset last search after hitting return nnoremap <silent> <CR> :let
" @/=""<CR><CR>
" Toggle line numbers and fold column for easy copying
noremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
inoremap <F2> <ESC>:set nonumber!<CR>:set foldcolumn=0<CR>i
" Switch to next buffer
noremap <F5> :bnext<CR>
inoremap <F5> <esc>:bnext<CR>
" Scroll up and down in place
nnoremap <C-j> <C-e>j
nnoremap <C-k> <C-y>k
" }}}
" General settings--------------{{{
syntax on                       " Enable syntax highlighting
filetype plugin indent on       " Find language dependent indenting
" Tabbing
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=8                   " This will get overwritten by file type
set autoindent                  " FileType indentations will override
" Searching
set ignorecase                  " Use case insensitive search...
set smartcase                   " ...except when using capital letters.
set hlsearch                    " Highlight search (C-l to hide)
set incsearch                   " Perform incremental search
" Movement
set nostartofline               " Don't always jump to start of line
set mouse=a                     " Enable use of mouse for all modes
set scrolloff=5                 " Leave 5 visible lines above/below cursor
" Information
set hidden                      " Allows undo history for multiple files
set number                      " Display line numbers on left
set laststatus=2                " Always display the status line
set confirm                     " Ask to save instead of aborting
set visualbell                  " Use visual bell instead of beeping
set cmdheight=2                 " Set command window height to 2 lines
" Files
set autochdir                   " Change working directory to open file
" }}}
" Discipline coding settings-----------{{{
" inoremap <up>    <nop>
" inoremap <down>  <nop>
" inoremap <left>  <nop>
" inoremap <right> <nop>
noremap <up>    <nop>
noremap <down>  <nop>
noremap <left>  <nop>
noremap <right> <nop>
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap UU <Esc>u
" }}}
" Vimscript file settings--------------{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" text file settings--------------{{{
augroup filetype_txt
  autocmd!
  " autocmd FileType text setlocal wrap linebreak nolist
  " autocmd FileType text setlocal formatoptions=amt
  " autocmd FileType text setlocal textwidth=80
  " autocmd FileType text setlocal wrapmargin=0
augroup END
" }}}
" LaTeX file settings--------------{{{
augroup filetype_latex
  autocmd!
  " autocmd FileType tex setlocal wrap linebreak nolist
  autocmd FileType tex setlocal formatoptions=amt
  autocmd FileType tex setlocal textwidth=80
  autocmd FileType tex setlocal wrapmargin=0
  let g:tex_flavor='latex'
  " Moved the following to tgd/ftplugin/tex.vim
  " autocmd FileType tex setlocal conceallevel=2
  " autocmd FileType tex hi! Conceal guibg=White guifg=DarkMagenta
  " let g:tex_conceal='adgms'
  " au VimEnter * syntax match NiceKeyword '\(_\|\<\)\zsalpha\ze\(\>\|_\)' conceal cchar=α
  " au VimEnter * syntax keyword Statement lambda conceal cchar=λ
  " au VimEnter * hi! link Conceal NiceKeyword
  " au VimEnter * set conceallevel=2
augroup END
" }}}
" Markdown file settings--------------{{{
augroup filetype_markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
" }}}
" Makefile file settings--------------{{{
augroup filetype_make
  autocmd!
  autocmd FileType make setlocal noexpandtab nosmarttab softtabstop=0
  autocmd FileType make setlocal shiftwidth=8
augroup END
" }}}
" Python file settings--------------{{{
augroup filetype_python
  autocmd!
  autocmd FileType python setlocal expandtab smarttab softtabstop=4
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal cindent cinwords=if,elif,else,for,while,try,except,finally,def,class,cdef,cclass
  " Visually highlight tabs and trailing whitespace
  autocmd FileType python setlocal list
  " autocmd FileType python setlocal listchars=trail:·,tab:»·
  " autocmd FileType python setlocal listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
  autocmd FileType python setlocal listchars=trail:·,precedes:«,extends:»,tab:»·
  " autocmd FileType python setlocal colorcolumn=80
  " autocmd BufWinEnter, FileType python let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  " Running and debugging Python code
  autocmd FileType python setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
  autocmd FileType python setlocal  efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  " autocmd FileType python nnoremap <F5> :!python %<CR>
  " syntax match spacehiTab /\t/ highlight spacehiTab ctermfg=1 cterm=underline
augroup END
" }}}
" Git settings--------------{{{
augroup filetype_git
  autocmd!
  autocmd FileType gitcommit setlocal spell
augroup END
" }}}
" SimpyFold plugin settings--------------{{{
augroup filetype_simpyfold
  autocmd!
  let g:SimpylFold_docstring_preview = 1
  " Foldable text documents
  au BufEnter *.fold set ai sw=2 ts=2 | set expandtab | set foldmethod=indent | set smartindent
augroup END
" }}}
" Syntastic plugin settings--------------{{{
augroup plugin_syntastic
  autocmd!
  let g:syntastic_python_python_exec = '/usr/bin/python3'
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '!'
  let g:syntastic_always_populate_loc_list=1
  " Use flake8
  " let g:syntastic_python_checkers = ['flake8']
  " let g:syntastic_python_flake8_args =
  " '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'
augroup END
" }}}
" Comment toggling settings--------------{{{
augroup comment_toggle
  autocmd FileType python,ruby,sh,make    let b:comment = '# '
  autocmd FileType vim                    let b:comment = '" '
  autocmd FileType tex                    let b:comment = '% '
  autocmd FileType c,cpp,java             let b:comment = '\/\/ '
  function! CommentToggle()
    if exists("b:comment")
      let a:comment = b:comment
    else
      let a:comment = '# '
    endif
    execute ':silent! s/\([^ ]\)/' . a:comment . '\1/'
    execute ':silent! s/^\( *\)' . a:comment . a:comment .'/\1/'
  endfunction

  " Add and remove line comments
  nnoremap <F7> :call CommentToggle()<CR>j
  imap <F7> <c-o><F7>
  nnoremap <leader>c :call CommentToggle()<CR>j
augroup END
" }}}
" Script settings--------------{{{
augroup filetype_script
  autocmd!
  " Automatically chmod +x Shell and Perl scripts
  au BufWritePost   *.sh             silent !chmod +x %
  au BufWritePost   *.pl             silent !chmod +x %
  au BufWritePost   *.py             silent !chmod +x %
  " au BufWritePost * if getline(1) =~ "^#!" | !chmod +x % | endif
augroup END
" }}}

autocmd BufNewFile,BufRead * let b:ActiveLineWrapState=0
function! ActiveLineWrapToggle()
  if b:ActiveLineWrapState
    execute "setlocal wrap=".b:ActiveLineWrapState_wrap
    let b:ActiveLineWrapState = 0
    echom "Toggle Off"
    echom &wrap
  else
    let b:ActiveLineWrapState = 1
    let b:ActiveLineWrapState_wrap = &wrap
    setlocal wrap
    echom "Toggle On"
    echom &wrap
  endif
endfunction
map <leader>w :call ActiveLineWrapToggle()

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" SOLARIZE
" syntax enable
" if has('gui_running')
" set background=light
" else
" set background=dark
" endif
" set t_Co=16
" let g:solarized_termcolors=16
" colorscheme solarized

" Programming
":imap <tab> <esc>==gi

" execute "pyfile ".fnameescape(fnamemodify(expand("<sfile>"), ":h")."/tgd_vim.py")
" Word mappings
" map <f9> :call AnagramCursorWord()<CR>
map <f9> :python AnagramCursorWord()<CR>

" Undo function in normal and insert mode
noremap <f12> :undo<CR>
inoremap <f12> <esc>:undo<CR>i
noremap <f11> :redo<CR>
inoremap <f11> <esc>:redo<CR>i
noremap <f10> :r !xclip -o<CR>
inoremap <f10> <esc>:r !xclip -o<CR>i

" Move up and down single lines in insert mode
imap <up> <esc>gka
imap <down> <esc>gja

" map <f2> :w\|!python %<cr>

" autocmd FileType todo nnoremap <leader>c A<CR><ESC>:python todo_copy_task()<CR>A
" autocmd FileType todo nnoremap <leader>x :python todo_toggle_completion()<CR>j

" More complicated CommentToggle for todo.txt format
" autocmd FileType todo nnoremap <F7> :python todo_toggle_completion()<CR>j
" autocmd FileType todo inoremap <F7> <ESC>:python todo_toggle_completion()<CR>ji

" Insert current date
" nnoremap <F6> "=strftime("%Y-%m-%d ")<CR>P
" inoremap <F6> <C-R>=strftime("%Y-%m-%d ")<CR>


" function! Browser ()
" let line = getline (".")
" let line = matchstr (line, "\%(https://\|www\.\)[^ ,;\t]*")
" echo "!google-chrome --new-window ".line
" exec "!google-chrome --new-window ".line
" endfunction
" map <Leader>w :call Browser()<CR>

" syntax match  rdocInlineURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/
syntax keyword rdocInlineURL https
au VimEnter * highlight rdocInlineURL   ctermfg=yellow

" TODO: vim pdb integration
" Python IDE
" http://blog.dispatched.ch/2009/05/24/vim-as-python-ide/
" vimpdb http://code.google.com/p/vimpdb/
