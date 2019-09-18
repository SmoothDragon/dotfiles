set nocompatible
" .vimrc by Thomas Draper
" FIRST! Pathogen bundle settings----------{{{
" PATHOGEN loads scripts in .vim/bundle directory
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
let g:pymode_python = 'python3'
" }}}
" VIM CUSTOMIZATION -----------------{{{
" Change mapleader from \ to ,
let mapleader = ","
" Change localleader to <Space>
let maplocalleader = "\<Space>"
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
:inoremap jk <esc>
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
" swap comma separated words
" nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>
" nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
" Transpose two words in comma separated list
nnoremap <leader>t diwmawPldw`aP
" Delete some text, visually highlight another, then C-X will swap the two
vnoremap <C-X> <Esc>`.``gvP``P
" }}}
" Abbreviations------------------{{{
iabbr ifname if __name__ == '__main__':<CR>import doctest<CR>doctest.testmod()
" }}}
" General settings--------------{{{
syntax enable                   " Enable syntax highlighting
filetype plugin indent on       " Find language dependent indenting
set shell=/bin/sh               " Tell vim which shell to execute commands in
" Tabbing
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=8                   " This will get overwritten by file type
" Searching
set ignorecase                  " Use case insensitive search...
set smartcase                   " ...except when using capital letters.
set autoindent                  " FileType indentations will override
set hlsearch                    " Highlight search (C-l to hide)
set incsearch                   " Perform incremental search
" Movement
set nostartofline               " Don't always jump to start of line
" set mouse=a                     " Enable use of mouse for all modes
set scrolloff=5                 " Leave 5 visible lines above/below cursor
" Information
set hidden                      " Allows undo history for multiple files
set number                      " Display line numbers on left
set laststatus=2                " Always display the status line
set confirm                     " Ask to save instead of aborting
set visualbell                  " Use visual bell instead of beeping
set cmdheight=2                 " Set command window height to 2 lines
" Files
set modelines=5                 " Allow Vim to readfile for settings
set autochdir                   " Change working directory to open file
set clipboard=unnamedplus       " Copy/paste to system clipboard (requires vim-gtk)
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
" inoremap II <Esc>I
" inoremap AA <Esc>A
" inoremap OO <Esc>O
" inoremap CC <Esc>C
" inoremap DD <Esc>dd
" inoremap UU <Esc>u
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
augroup filetype_latex autocmd!
  " autocmd FileType tex setlocal wrap linebreak nolist
  " autocmd FileType tex setlocal formatoptions=want
  autocmd FileType tex setlocal textwidth=80
  autocmd FileType tex setlocal wrapmargin=0
  autocmd FileType tex setlocal expandtab smarttab softtabstop=2
  autocmd FileType tex setlocal shiftwidth=2
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
" SimpyFold plugin settings--------------{{{
augroup filetype_simpyfold
  autocmd!
  let g:SimpylFold_docstring_preview = 1
  " Foldable text documents
  au BufEnter *.fold set ai sw=2 ts=2 | set expandtab | set foldmethod=indent | set smartindent
augroup END
" }}}
" Python file settings--------------{{{
augroup filetype_python
  autocmd!
  autocmd FileType python setlocal expandtab smarttab softtabstop=4
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal encoding=utf-8
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
  " autocmd FileType python setlocal foldmethod=syntax
  " autocmd FileType python syn sync fromstart
  " autocmd FileType python syn region  pythonFunctionFostart="^\z(\s*\)\%(def\|class\) " skip="^\s*$" end="^\ze\%(\z1\s\)\@!." fold transparent
augroup END
" }}}
" reST file settings--------------{{{
augroup filetype_rst
  autocmd!
  autocmd FileType rst setlocal expandtab smarttab softtabstop=3
  autocmd FileType rst setlocal shiftwidth=3
  " Visually highlight tabs and trailing whitespace
  autocmd FileType rst setlocal list
  " autocmd FileType python setlocal listchars=trail:·,tab:»·
  " autocmd FileType python setlocal listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
  autocmd FileType rst setlocal listchars=trail:·,precedes:«,extends:»,tab:»·
  " autocmd FileType python setlocal colorcolumn=80
  " autocmd BufWinEnter, FileType python let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  " Running and debugging Python code
  " autocmd FileType python nnoremap <F5> :!python %<CR>
  " syntax match spacehiTab /\t/ highlight spacehiTab ctermfg=1 cterm=underline
augroup END
" }}}
" R file settings--------------{{{
augroup filetype_r
  autocmd!
  autocmd FileType r setlocal expandtab smarttab softtabstop=4
  autocmd FileType r setlocal shiftwidth=4
  autocmd FileType r setlocal cindent cinwords=if,elif,else,for,while,try,except,finally,def,class,cdef,cclass
  " Visually highlight tabs and trailing whitespace
  autocmd FileType r setlocal list
  " autocmd FileType python setlocal listchars=trail:·,tab:»·
  " autocmd FileType python setlocal listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
  autocmd FileType r setlocal listchars=trail:·,precedes:«,extends:»,tab:»·
  " autocmd FileType python setlocal colorcolumn=80
  " autocmd BufWinEnter, FileType python let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  " Running and debugging Python code
  " autocmd FileType python setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
  " autocmd FileType python setlocal  efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  " autocmd FileType python nnoremap <F5> :!python %<CR>
  " syntax match spacehiTab /\t/ highlight spacehiTab ctermfg=1 cterm=underline
augroup END
" }}}
" Haskell file settings--------------{{{
augroup filetype_haskell
  autocmd!
  autocmd FileType haskell setlocal expandtab smarttab softtabstop=2
  autocmd FileType haskell setlocal shiftwidth=2
  " autocmd FileType haskell setlocal cindent cinwords=if,elif,else,for,while,try,except,finally,def,class,cdef,cclass
  " Visually highlight tabs and trailing whitespace
  " autocmd FileType haskell setlocal list
  " autocmd FileType haskell setlocal listchars=trail:·,tab:»·
  " autocmd FileType haskell setlocal listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
  " autocmd FileType haskell setlocal listchars=trail:·,precedes:«,extends:»,tab:»·
  " autocmd FileType haskell setlocal colorcolumn=80
  " autocmd BufWinEnter, FileType haskell let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  " Running and debugging haskell code
  " autocmd FileType haskell setlocal makeprg=haskell\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
  " autocmd FileType haskell setlocal  efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  " autocmd FileType haskell nnoremap <F5> :!haskell %<CR>
  " syntax match spacehiTab /\t/ highlight spacehiTab ctermfg=1 cterm=underline
augroup END
" }}}
" Git settings--------------{{{
augroup filetype_git
  autocmd!
  autocmd FileType gitcommit setlocal spell
augroup END
" }}}
" Slimux plugin settings--------------{{{
augroup filetype_slimus
  autocmd!
  nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
  vnoremap <C-c><C-c> :SlimuxREPLSendSelection<CR>
  nnoremap <C-c><C-v> :SlimuxREPLConfigure<CR>
augroup END
" }}}
" Syntastic plugin settings--------------{{{
augroup plugin_syntastic
  autocmd!
  " let g:syntastic_python_python_exec = '/usr/bin/python3'
  " let g:syntastic_error_symbol = '✗'
  " let g:syntastic_warning_symbol = '!'
  " let g:syntastic_always_populate_loc_list=1
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
  autocmd FileType tex,zinc,matlab        let b:comment = '% '
  autocmd FileType c,cpp,java,openscad,javascript,gv let b:comment = '\/\/ '
  autocmd FileType haskell                let b:comment = '-- '
  function! CommentToggle()
    if exists("b:comment")
      let comment = b:comment
    else
      let comment = '# '
    endif
    execute ':silent! s/\([^ ]\)/' . comment . '\1/'
    execute ':silent! s/^\( *\)' . comment . comment .'/\1/'
  endfunction

  " Add and remove line comments
  nnoremap <SPACE> :call CommentToggle()<CR>j
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

" Status Line settings---------{{{
"statusline setup
" set statusline =%#identifier#
" set statusline+=[%t] "tail of the filename
" set statusline+=%*
"display a warning if fileformat isnt unix
" set statusline+=%#warningmsg#
" set statusline+=%{&ff!='unix'?'['.&ff.']':''}
" set statusline+=%*
"display a warning if file encoding isnt utf-8
" set statusline+=%#warningmsg#
" set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
" set statusline+=%*
" set statusline+=%h "help file flag
" set statusline+=%y "filetype
"read only flag
" set statusline+=%#identifier#
" set statusline+=%r
" set statusline+=%*
"modified flag
" set statusline+=%#identifier#
" set statusline+=%m
" set statusline+=%*
" set statusline+=%{fugitive#statusline()}
"display a warning if &et is wrong, or we have mixed-indenting
" set statusline+=%#error#
" set statusline+=%{StatuslineTabWarning()}
" set statusline+=%*
" set statusline+=%{StatuslineTrailingSpaceWarning()}
" set statusline+=%{StatuslineLongLineWarning()}
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"display a warning if &paste is set
" set statusline+=%#error#
" set statusline+=%{&paste?'[paste]':''}
" set statusline+=%*
" set statusline+=%= "left/right separator
" set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
" set statusline+=%c, "cursor column
" set statusline+=%l/%L "cursor line/total lines
" set statusline+=\ %P "percent through file
" set laststatus=2
"recalculate the trailing whitespace warning when idle, and after saving
" autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
"return '[\s]' if trailing white space is detected
"return '' otherwise
" function! StatuslineTrailingSpaceWarning()
" if !exists("b:statusline_trailing_space_warning")
" if !&modifiable
" let b:statusline_trailing_space_warning = ''
" return b:statusline_trailing_space_warning
" endif
" if search('\s\+$', 'nw') != 0
" let b:statusline_trailing_space_warning = '[\s]'
" else
" let b:statusline_trailing_space_warning = ''
" endif
" endif
" return b:statusline_trailing_space_warning
" endfunction
"return the syntax highlight group under the cursor ''
" function! StatuslineCurrentHighlight()
" let name = synIDattr(synID(line('.'),col('.'),1),'name')
" if name == ''
" return ''
" else
" return '[' . name . ']'
" endif
" endfunction
"recalculate the tab warning flag when idle and after writing
" autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
" function! StatuslineTabWarning()
" if !exists("b:statusline_tab_warning")
" let b:statusline_tab_warning = ''
" if !&modifiable
" return b:statusline_tab_warning
" endif
" let tabs = search('^\t', 'nw') != 0
" "find spaces that arent used as alignment in the first indent column
" let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
" if tabs && spaces
" let b:statusline_tab_warning = '[mixed-indenting]'
" elseif (spaces && !&et) || (tabs && &et)
" let b:statusline_tab_warning = '[&et]'
" endif
" endif
" return b:statusline_tab_warning
" endfunction
" "recalculate the long line warning when idle and after saving
" autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning
" "return a warning for "long lines" where "long" is either &textwidth or 80 (if
" "no &textwidth is set)
" "
" "return '' if no long lines
" "return '[#x,my,$z] if long lines are found, were x is the number of long
" "lines, y is the median length of the long lines and z is the length of the
" "longest line
" function! StatuslineLongLineWarning()
" if !exists("b:statusline_long_line_warning")
" if !&modifiable
" let b:statusline_long_line_warning = ''
" return b:statusline_long_line_warning
" endif
" let long_line_lens = s:LongLines()
" if len(long_line_lens) > 0
" let b:statusline_long_line_warning = "[" .
" \ '#' . len(long_line_lens) . "," .
" \ 'm' . s:Median(long_line_lens) . "," .
" \ '$' . max(long_line_lens) . "]"
" else
" let b:statusline_long_line_warning = ""
" endif
" endif
" return b:statusline_long_line_warning
" endfunction
" "return a list containing the lengths of the long lines in this buffer
" function! s:LongLines()
" let threshold = (&tw ? &tw : 80)
" let spaces = repeat(" ", &ts)
" let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
" return filter(line_lens, 'v:val > threshold')
" endfunction
" "find the median of the given array of numbers
" function! s:Median(nums)
" let nums = sort(a:nums)
" let l = len(nums)
" if l % 2 == 1
" let i = (l-1) / 2
" return nums[i]
" else
" return (nums[l/2] + nums[(l/2)-1]) / 2
" endif
" endfunction
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

