" customize common setting
set number
set cmdheight=2
set laststatus=2
"set statusline=%F%m%r%h%w\%=\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%/%L]\ [%{&fileencoding}/%{&ff}]
set statusline=%F%m%r%h%w\%=\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%(%l/%L)]\ [%{&fileencoding}/%{&ff}]

" enable backspace
set backspace=start,eol,indent

" set nocompatible
syntax on

set tags+=./tags;

" highligh cursor line
set cursorline

set nocompatible
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
