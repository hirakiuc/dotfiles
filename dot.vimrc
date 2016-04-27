if has('vim_starting')
  if &compatible
    set nocompatible  " Be iMproved
  endif
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
NeoBundleLazy 'Shougo/unite.vim', {
      \ 'autoload' : { 'commands' : [ 'Unite' ] }
      \}

NeoBundleLazy 'Shougo/vimfiler.vim', {
      \ 'depends':["Shougo/unite.vim"],
      \ 'autoload':{
      \   'commands': ["VimFilerTab", "VimFiler", "VimFilerExplorer"]
      \ }
      \}

NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends':["Shougo/unite.vim"],
      \   'commands':["Unite"]
      \}

NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundleLazy 'glidenote/serverspec-snippets', {
      \ 'autoload': {
      \   'filetypes' : ['ruby','serverspec']
      \ }
      \}
NeoBundle 'honza/vim-snippets'

NeoBundle 'ctrlpvim/ctrlp.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'

NeoBundleLazy 'vim-ruby/vim-ruby', {
      \ 'autoload' : {
      \   'filetypes' : ['ruby','rake']
      \ }
      \}
NeoBundleLazy 'keith/rspec.vim', {
      \ 'autoload': {
      \   'filetypes' : ['ruby']
      \ }
      \}

" languages
NeoBundleLazy 'slim-template/vim-slim', {
      \ 'autoload': { 'filetypes' : ['slim'] }
      \}
NeoBundleLazy 'kchmck/vim-coffee-script', {
      \ 'autoload': { 'filetypes' : ['coffee'] }
      \}
NeoBundleLazy 'groenewege/vim-less', {
      \ 'autoload': { 'filetypes' : ['less'] }
      \}
NeoBundleLazy 'wavded/vim-stylus', {
      \ 'autoload': { 'filetypes' : ['styl'] }
      \}
NeoBundleLazy 'mattn/emmet-vim', {
      \ 'autoload': { 'filetypes' : ['html','css'] }
      \}
NeoBundleLazy 'othree/yajs.vim', {
      \ 'autoload' : { 'filetypes' : ['javascript', 'jsx'] }
      \}
NeoBundleLazy 'othree/es.next.syntax.vim', {
      \ 'autoload' : { 'filetypes' : ['javascript', 'jsx'] }
      \}
NeoBundleLazy 'mxw/vim-jsx', {
      \ 'autoload' : { 'filetypes' : ['javascript', 'jsx'] }
      \}
NeoBundleLazy 'fatih/vim-go', {
      \ 'autoload' : { 'filetypes' : ['go'] }
      \}
NeoBundleLazy 'elixir-lang/vim-elixir', {
      \ 'autoload' : { 'filetypes' : ['exs'] }
      \}
if has("mac")
  NeoBundleLazy 'toyamarinyon/vim-swift', {
        \ 'autoload' : { 'filetypes' : ['swift'] }
        \}
endif

NeoBundleLazy 'scrooloose/syntastic', {
      \ 'autoload' : { 'filetypes' : ['ruby', 'coffee', 'go', 'javascript'] }
      \}

" Utility
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'rking/ag.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kana/vim-submode'
NeoBundle 'wakatime/vim-wakatime'

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
