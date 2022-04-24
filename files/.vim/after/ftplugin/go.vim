if exists("b:did_ftplugin_go")
  finish
endif
let b:did_ftplugin_go=1

setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
