return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e'] = cmp.mapping.abort(),
          ['<Esc>'] = cmp.mapping.close(),
          ['<CR>'] = function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        sources = cmp.config.sources({
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'path' },
        }),
      })
    end,
  },
  -- lsp plugins
  {
    'neovim/nvim-lspconfig',
    cmd = { "LspInfo", "LspLog" },
    event = { "BufRead" },
    config = function()
      require('lspconfig').lua_ls.setup({
        Lua = {
          diagnostics = {
            globals = {'vim'},
          },
        },
      })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'mihyaeru21/nvim-lspconfig-bundler',
    },
    config = function()
      local lspconfig = require('mason-lspconfig')
      lspconfig.setup({
        ensure_installed = {
          "cmake",
          "tsserver",
          "gopls",
          "jsonls",
          "lua_ls",
          "solargraph",
          "ruby_ls",
          "svelte",
          "taplo",
          "yamlls",
        },
        automatic_installation = true,
      })

      -- For ruby dev. (Use bundled gem, instead of installed by this plugin)
      require('lspconfig-bundler').setup()

      capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.setup_handlers({
        function(server_name)
          local config = require('lspconfig')
          config[server_name].setup({
            capabilities = capabilities
          })
        end
      })
    end
  },
  {
    'williamboman/mason.nvim',
    cmd = { "Mason", "MasonInstall" },
    event = { "WinNew", "WinLeave", "BufRead" },
    config = function()
      require('mason').setup()
    end
  },
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
  }
}
