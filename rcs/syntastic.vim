set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

let g:syntastic_mode_map = { 'mode' : 'passive', 'active_filetypes' : ['ruby', 'coffee', 'go'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
