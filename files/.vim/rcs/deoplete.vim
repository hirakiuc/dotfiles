if has('nvim')
  let g:deoplete#enable_at_startup = 1

  call deoplete#custom#option({
        \  'enable_at_startup': 1,
        \  'auto_complete_delay': 10,
        \  'enable_smart_case': 1,
        \  'enable_ignore_case': 1,
        \  'enable_buffer_path': 1,
        \  'delimiters': ['/', '.'],
        \  'ignore_sources': {
        \    '_'  : get(g:, 'deoplete#ignore_sources', {}),
        \    'php': ['omni'],
        \  }
        \})

  inoremap <expr><tab> pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \   "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

  " not stop completion
  setlocal iskeyword+=$
  setlocal iskeyword+=-
endif
