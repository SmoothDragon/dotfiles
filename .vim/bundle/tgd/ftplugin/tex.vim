" LaTeX (rubber) macro for compiling
nnoremap <leader>C :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>


setlocal iskeyword+=:,-
setlocal makeprg=pdflatex\ -file-line-error\ -interation=nonstopmode\ %
set suffixes+=.log,.aux,.bbl,.blg,.idx,.ilg,.ind,.out,.pdf
inoremap <buffer> { {}<ESC>i
inoremap <buffer> [ []<ESC>i
iabbrev <buffer> ,b \begin{
iabbrev <buffer> ,e \end{

" Set colorscheme, enable conceal (except for
" subscripts/superscripts), and match conceal
" highlight to colorscheme
" colorscheme topfunky-light
set conceallevel=2
let g:tex_conceal= 'adgms'
hi Conceal guibg=White guifg=DarkMagenta
