if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_ignore_case = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#auto_complete_deplay = 10
  let g:deoplete#delimiters = ['/', '.']
  inoremap <expr><tab> pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \   "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

  let g:deoplete#file#enable_buffer_path = 1

  " for lvht/phpcd.vim plugin
  let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
  let g:deoplete#ignore_sources.php = ['omni']

  " for LanguageClient-neovim
  set hidden
  let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls'],
    \ }
  " not stop completion
  setlocal iskeyword+=$
  setlocal iskeyword+=-
endif
