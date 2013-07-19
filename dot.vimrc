" neobundle
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" plugin
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'msanders/cocoa.vim'
NeoBundle 'Markdown'
NeoBundle 'tpope/vim-endwise.git'

NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'

NeoBundle 'rdolgushin/play.vim'
NeoBundle 'derekwyatt/vim-scala'

NeoBundle 'airblade/vim-gitgutter'

" colorscheme
NeoBundle 'nanotech/jellybeans.vim'

filetype plugin indent on

colorscheme jellybeans

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

" vim-endwise


""" neocomplcache plugin
" disable AutoComplPop
let g:acp_enableAtStartup = 0
" use neocomplcache
let g:neocomplcache_enable_at_startup = 1
" use smartcase.
let g:neocomplcache_enable_smart_case = 1
" use camel case completion
let g:neocomplcache_enable_camel_case_completion = 1
" use underbar completion
let g:neocomplcache_enable_underbar_completion = 1
" set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" Enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

""" unite
" 入力モードで開始する
" let g:unite_enable_start_insert=1
"
" buffer list
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" file list
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" register list
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" recently file list
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" all list
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" open with split window
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" open with vertical split window
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" end with two escape key tap
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction


""" enable filetype plugin
filetype on
filetype indent on
filetype plugin on

"" vim-ruby
set nocompatible

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec  set filetype=ruby

" encoding
execute "source " . '~/.vim/auto-encoding.vim'
execute "source " . '~/.vim/highlight-trailing-spaces.vim'

" http://kazukiq.ldblog.jp/archives/51843772.html
if has('mac')
  autocmd FocusGained * set transparency=10
  autocmd FocusLost * set transparency=50
endif

" for java
autocmd FileType java set expandtab|set tabstop=2|set softtabstop=2|set shiftwidth=2

" for us keyboard
noremap ; :
noremap : ;

NeoBundleCheck

