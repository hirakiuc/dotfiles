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
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'basyura/unite-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Keithbsmiley/rspec.vim'
"NeoBundle 'msanders/cocoa.vim'
"NeoBundle 'Markdown'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'rking/ag.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundleLazy 'Blackrush/vim-gocode', { 'autoload': {'filetypes': ['go']} }

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kana/vim-submode'
" NeoBundle 'tpope/vim-pathogen'
NeoBundle 'scrooloose/syntastic', {
  \ 'build': {
  \   'mac' :['npm -g install coffeelint'],
  \   'unix':['npm -g install coffeelint']
  \ }}

" colorscheme
NeoBundle 'nanotech/jellybeans.vim'

" config for pathogen
execute pathogen#infect()

filetype plugin indent on

colorscheme jellybeans

" vim-endwise

" load ~/.vim/rcs/*.vim
set runtimepath+=~/.vim/
runtime! rcs/*.vim

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
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" cap, Gemfile
au BufNewFile,BufRead *.cap set ft=ruby

" encoding
"execute "source " . '~/.vim/auto-encoding.vim'
execute "source " . '~/.vim/highlight-trailing-spaces.vim'

" http://kazukiq.ldblog.jp/archives/51843772.html
if has('mac')
  autocmd FocusGained * set transparency=10
  autocmd FocusLost * set transparency=50
endif

" for us keyboard
noremap ; :
noremap : ;

NeoBundleCheck
