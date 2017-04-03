let s:dein_dir = expand('~/.vim/cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if &compatible
  set nocompatible
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:rc_dir    = expand('~/.vim/')
  let s:toml      = s:rc_dir . 'dein.toml'
  let s:toml_lazy = s:rc_dir . 'dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

set background=dark
colorscheme jellybeans

filetype plugin indent on

" load ~/.vim/rcs/*.vim
set runtimepath+=~/.vim/
runtime! rcs/*.vim

" encoding
"execute "source " . '~/.vim/auto-encoding.vim'
execute "source " . '~/.vim/highlight-trailing-spaces.vim'

" http://kazukiq.ldblog.jp/archives/51843772.html
if has('mac') && has('vim')
  autocmd FocusGained * set transparency=10
  autocmd FocusLost * set transparency=50
endif

" for us keyboard
noremap ; :
noremap : ;
