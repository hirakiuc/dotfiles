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
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'basyura/unite-rails'
NeoBundle 'msanders/cocoa.vim'
NeoBundle 'Markdown'
NeoBundle 'tpope/vim-endwise.git'

NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kana/vim-submode'
NeoBundle 'scrooloose/syntastic'

" colorscheme
NeoBundle 'nanotech/jellybeans.vim'

" load ~/.vim/rcs/*.vimrc
set runtimepath+=~/.vim/
runtime! rcs/*.vimrc

""" enable filetype plugin
filetype on
filetype indent on
filetype plugin on

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

" for us keyboard
" noremap ; :
" noremap : ;

" http://qiita.com/yuku_t/items/0ac33cea18e10f14e185
" syntastic for ruby
"let g:syntastic_mode_map = { 'mode' : 'passive', 'active_filetypes' : ['ruby'] }
"let g:syntastic_ruby_checkers = ['rubocop']
"let g:syntastic_quiet_warnings = 0

NeoBundleCheck

