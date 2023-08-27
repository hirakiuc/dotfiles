function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  nnoremap <buffer> <expr><c-j> lsp#scroll(+1)
  nnoremap <buffer> <expr><c-k> lsp#scroll(-1)

  inoremap <expr> <cr> ((pumvisible()) ? (deoplete#close_popup()) : ("\<cr>"))
endfunction

" augroup lsp_install
"  au!
"  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_settings_root_markers = [ '.git', '.git/' ]

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_text_edit_enabled = 1
let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1

let g:lsp_settings_filetype_go = ['gopls']
let g:lsp_settings_filetype_typescript = ['deno']

let g:lsp_settings = #{
  \ gopls: #{
  \   workspace_config: #{
  \     usePlaceholders: v:true,
  \     analyses: #{
  \       fillstruct: v:true,
  \     },
  \   },
  \   initialization_options: #{
  \    usePlaceholders: v:true,
  \    analyses: #{
  \      fillstruct: v:true,
  \    },
  \  },
  \ },
  \}

set completeopt+=menuone,preview
