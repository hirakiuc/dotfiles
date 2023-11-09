return {
  {
    'mattn/vim-goimports',
    ft = { 'go' },
    config = function()
      -- enable auto format when write (default)
      vim.g.goimports = 1
      -- disable simplify filter
      vim.g.goimports_simplify = 1

      vim.g.goimports_cmd = 'gci'
      vim.g.goimports_simplify_cmd = 'gofumpt'
    end,
  },
}
