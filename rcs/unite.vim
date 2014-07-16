""" unite
" 入力モードで開始する
" let g:unite_enable_start_insert=1
"
" buffer list
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" file list
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" register list
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" recently file list
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" all list
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" open with split window
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" open with vertical split window
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" end with two escape key tap
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction


