return {
  {
    'dense-analysis/ale',
    config = function()
      vim.g.ale_linters = {
        javascript = {'eslint'},
        go = { 'gofmt', 'golangci-lint' },
        typescriptreact = { 'eslint' },
        ruby = { 'ruby', 'rubocop' },
      }

      -- Disable linters, except for explicitly configured linters.
      vim.g.ale_linters_explicit = 1

      -- Enable that the whole go package will be checked instead of only the currnet file
      vim.g.ale_go_golangci_lint_package = 1

      -- keep the sign gutter open at all times
      vim.g.ale_sign_column_always = 1

      -- Enable linters on save
      vim.g.ale_lint_on_save = 1
      vim.g.ale_lint_on_text_changed = 0
      -- Disable linting on opening a file
      vim.g.ale_lint_on_enter = 0

      vim.g.ale_fixers = {
        'remove_trailing_lines',
        'trim_whitespace',
      }

      -- Invoke rubocop with 'bundle exec'
      vim.g.ale_ruby_rubocop_executable = 'bundle'
    end,
  },
}
