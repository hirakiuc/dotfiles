-- plugins for code
return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  {
    'RRethy/nvim-treesitter-endwise',
    config = function()
      require('nvim-treesitter.configs').setup({
        endwise = {
          enable = true,
        },
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufRead", "BufNewFile"},
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
          -- load_textobjects = true
        end,
      },
    },
    cmd = { "TSUpdateSync" },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "mermaid",
          "dockerfile",
          "diff",
          "gitignore",
          "svelte",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
          "go",
        },
      })
    end
  },

}
