let s:dein_dir = expand('~/.vim/cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

let g:python3_host_prog = '/opt/homebrew/bin/python3'

let g:ruby_host_prog = '/usr/local/opt/rbenv/shims/neovim-ruby-host'

if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_repo_dir)

  let s:rc_dir    = expand('~/.vim/')
  let s:toml      = s:rc_dir . 'dein.toml'
  let s:toml_lazy = s:rc_dir . 'dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set background=dark
colorscheme jellybeans

" load ~/.vim/rcs/*.vim
set runtimepath+=~/.vim/
runtime! rcs/*.vim

" encoding
"execute "source " . '~/.vim/auto-encoding.vim'
"execute "source " . '~/.vim/highlight-trailing-spaces.vim'

" http://kazukiq.ldblog.jp/archives/51843772.html
if has('mac') && has('vim')
  autocmd FocusGained * set transparency=10
  autocmd FocusLost * set transparency=50
endif

if has('nvim')
  set ttimeout
  set ttimeoutlen=50
endif

" for us keyboard
noremap ; :
noremap : ;
