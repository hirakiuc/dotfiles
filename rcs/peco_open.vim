function! PecoOpen()
  for filename in split(system("hawkeye | peco"), "\n")
    execute "e" filename
  endfor
endfunction
nnoremap <Leader>op :call PecoOpen()<CR>
