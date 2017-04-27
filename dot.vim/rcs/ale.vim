let g:ale_linters = {
      \ 'javascript' : ['eslint'],
      \}

" keep the sign gutter open at all times
let g:ale_sign_column_always = 1

" show errors on status line.
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" navigate between errors.
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Run linters on saving files.
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" Don't run on opening a file
let g:ale_lint_on_enter = 0
