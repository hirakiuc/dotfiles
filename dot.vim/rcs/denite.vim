if has('nvim')
  call denite#custom#var('file_rec', 'command',
   \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ ['.git/', '.bundle/', 'node_modules/', '*.swp', '*~', 'vendor/'])

  call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
  call denite#custom#source('directory_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])

  call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

  " key mapping
  nnoremap [denite] <Nop>
  nmap ` [denite]

  nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
  nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>
  nnoremap <silent> [denite]d :<C-u>Denite directory_rec<CR>
  nnoremap <silent> [denite]g :<C-u>Denite grep<CR>
  nnoremap <silent> [denite]r :<C-u>Denite -resume<CR>

  nnoremap <silent> [denite]p :<C-u>Denite -resume -immediately -select=-1<CR>
  nnoremap <silent> [denite]n :<C-u>Denite -resume -immediately -select=+1<CR>
endif
