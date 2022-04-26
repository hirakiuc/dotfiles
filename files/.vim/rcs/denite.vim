if has('nvim')
  let s:denite_win_width_percent = 0.8
  let s:denite_win_height_percent = 0.6

  call denite#custom#var('file/rec', 'command',
   \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ ['.git/', '.bundle/', 'node_modules/', '*.swp', '*~', 'vendor/'])

  call denite#custom#source('file/rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
  call denite#custom#source('file/rec', 'sorters', ['sorter/word'])
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

  " Define mappings
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'

    " Reopen parend directory.
    inoremap <silent><buffer><expr> <BS> denite#do_map('move_up_path')
  endfunction

  nnoremap <silent> [denite]b :Denite buffer -split=floating<CR>
  nnoremap <silent> [denite]f :Denite file/rec -split=floating<CR>
  nnoremap <silent> [denite]d :Denite directory_rec -split=floating<CR>
  nnoremap <silent> [denite]g :Denite grep -split=floating<CR>
  nnoremap <silent> [denite]r :Denite -resume -split=floating<CR>

  nnoremap <silent> [denite]p :Denite -resume -immediately -select=-1<CR>
  nnoremap <silent> [denite]n :Denite -resume -immediately -select=+1<CR>
endif
