function! PecoOpen()
  for filename in split(system("find . -type f -o -path './.git' -prune | peco"), "\n")
    execute "e" filename
  endfor
endfunction
nnoremap <Leader>op :call PecoOpen()<CR>
