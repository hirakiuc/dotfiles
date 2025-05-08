return {
  {
    'Shougo/ddc.vim',
    dependencies = {
      'vim-denops/denops.vim',
      'Shougo/ddc-ui-native',
      'Lumakernel/ddc-source-file',
      -- 'tani/ddc-path', this plugins doesn't work for me yet.
      'Shougo/ddc-source-around',
      'Shougo/ddc-source-lsp',
      'Shougo/ddc-filter-matcher_head',
      'Shougo/ddc-filter-sorter_rank',
      -- copilot
      'github/copilot.vim',
      'Shougo/ddc-source-copilot',
      -- preview
      'uga-rosa/ddc-previewer-floating',
      'matsui54/denops-signature_help',
    },
    config = function()
      -- for copilot
      vim.g.copilot_no_maps = true

      vim.fn["ddc#custom#patch_global"]('ui', 'native')

      vim.fn["ddc#custom#patch_global"]('sources', {'around', 'file', 'lsp', 'copilot'})

      vim.fn["ddc#custom#patch_global"]('sourceOptions', {
        _ = {
          matchers = {'matcher_head'},
          sorters = {'sorter_rank'},
        },
        around = {
          mark = 'A',
        },
        path = {
          mark = 'P',
          forceCompletionPattern = '\\S/\\S*',
        },
        file = {
          mark = 'F',
          isVolatile = true,
          forceCompletionPattern = '\\S/\\S*',
        },
        lsp = {
          mark = 'LSP',
          forceCompletionPattern = '\\.\\w*|:\\w*|->\\w*',
        },
        copilot = {
          mark = 'copilot',
          matchers = {},
          minAutoCompleteLength = 0,
          isVolatile = true,
        }
      })

      vim.fn["ddc#custom#patch_global"]('sourceParams', {
        path = {
          cmd = {'fd', '--max-depth', '10'},
          absolute = false,
        },
        lsp = {
          --[[
          snippetEngine = vim.fn["denops#callback"('register', function() {
            body -> vsnip
          }),
          ]]--
          enableResolveItem = true,
          enableAdditionalTextEdit = true,
        },
      })

      -- Key Mappings
      -- <TAB>, S-<TAB>
      vim.api.nvim_exec2([[
        inoremap <expr> <TAB>
        \ pumvisible() ? '<C-n>' :
        \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
        \ '<TAB>' : ddc#map#manual_complete()

        inoremap <expr> <S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
      ]], { output = false })

      local ddc_previewer_floating = require('ddc_previewer_floating')
      ddc_previewer_floating.setup({
        ui = 'native',
      })
      ddc_previewer_floating.enable()

      -- Enable denops-signature_help
      vim.fn["signature_help#enable"]()

      vim.fn["ddc#enable"]()
    end
  },
  -- lsp plugins
  {
    'neovim/nvim-lspconfig',
    cmd = { "LspInfo", "LspLog" },
    event = { "BufRead" },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'mihyaeru21/nvim-lspconfig-bundler',
    },
    config = function()
      local masonLspConfig = require('mason-lspconfig')
      masonLspConfig.setup({
        ensure_installed = {
          "cmake",
          "tsserver",
          "gopls",
          "jsonls",
          "lua_ls",
          "solargraph",
          "svelte",
          "taplo",
          "yamlls",
        },
        automatic_installation = true,
      })

      -- For ruby dev. (Use bundled gem, instead of installed by this plugin)
      require('lspconfig-bundler').setup()

      local capabilities = require('ddc_source_lsp').make_client_capabilities()

      masonLspConfig.setup_handlers({
        function(server_name)
          local config = require('lspconfig')
          config[server_name].setup({
            capabilities = capabilities
          })
        end
      })

      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                'vim',
              },
            },
          },
        },
      })

      lspconfig.yamlls.setup({
        settings = {
          yaml = {
            customTags = {
              -- Setup for the CloudFormation templates
              '!Ref scalar',
              '!fn',
              '!Sub',
              '!GetAtt',
            },
          },
        },
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
}
