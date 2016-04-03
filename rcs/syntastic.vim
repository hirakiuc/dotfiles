let g:syntastic_mode_map = { 'mode' : 'passive', 'active_filetypes' : ['ruby', 'coffee', 'js', 'go'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
