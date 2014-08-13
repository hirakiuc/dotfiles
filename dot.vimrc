" neobundle
set nocompatible

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

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
NeoBundle 'Markdown'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'rking/ag.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kana/vim-submode'
NeoBundle 'scrooloose/syntastic'

" colorscheme
NeoBundle 'nanotech/jellybeans.vim'

call neobundle#end()

filetype plugin indent on

colorscheme jellybeans

" load ~/.vim/rcs/*.vim
set runtimepath+=~/.vim/
runtime! rcs/*.vim

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
