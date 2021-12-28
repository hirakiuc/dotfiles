let g:neoformat_only_msg_on_error = 1

" Enable trimming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_enabled_go = ['gofumpt']
autocmd BufWritePre *.go Neoformat
