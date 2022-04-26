" http://www.ispern.com/?p=324
set guifontwide=Osaka:h14
set guifont=SourceCodePro-Regular:h14

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

set transparency=3

