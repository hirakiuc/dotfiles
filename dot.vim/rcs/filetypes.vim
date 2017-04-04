" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec  set filetype=ruby
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" cap, Gemfile
au BufNewFile,BufRead *.cap set ft=ruby

" ruby templates
au BufNewFile,BufRead *.jb set ft=ruby
au BufNewFile,BufRead *.yajl set ft=ruby
