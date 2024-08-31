return {
  {
    'Shougo/ddu.vim',
    dependencies = {
      'vim-denops/denops.vim',

      -- ui plugin
      'Shougo/ddu-ui-ff',
      -- action plugins
      'Shougo/ddu-kind-file',
      -- filter plugins
      'Shougo/ddu-filter-matcher_substring',
      'uga-rosa/ddu-filter-converter_devicon',
      -- kind plugins
      'Shougo/ddu-kind-file',
      -- source plugins
      'Shougo/ddu-source-file_rec',
      'shun/ddu-source-buffer',
    },
    config = function()
      -- Ref: https://zenn.dev/vim_jp/articles/20231020step-by-step-ddu

      -- default ui
      vim.fn["ddu#custom#patch_global"]({
        ui = 'ff',
        uiParams = {
          ff = {
            filterFloatingPosition = "bottom",
            filterSplitDirection = "floating",
            floatingBorder = "rounded",
            previewFloating = true,
            previewFloatingBorder = "rounded",
            previewFloatingTitle = "Preview",
            previewSplit = "horizontal",
            prompt = "> ",
            split = "floating",
            startFilter = true,
          },
        },
        sourceOptions = {
          _ = {
            matchers = {
              'matcher_substring',
            },
            ignoreCase = true,
          },
        },
        kindOptions = {
          file = {
            defaultAction = "open",
          },
        },
      })

      vim.fn["ddu#custom#patch_local"]("file_rec", {
        sources = {
          {
            name = { "file_rec" },
            options = {
              converters = {
                "converter_devicon",
              },
            },
            params = {
              ignoreDirectories = {
                "node_modules",
                ".git",
                "dist",
                ".vscode",
              },
            },
          },
        },
      })

      vim.fn["ddu#custom#patch_local"]("buffer", {
        sources = {
          {
            name = { "buffer" },
          },
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = 'ddu-ff',
        callback = function()
          local opts = { noremap = true, silent = true, buffer = true }
          vim.keymap.set({ "n" },    "q", [[<Cmd>call ddu#ui#do_action("quit")<CR>]], opts)
          vim.keymap.set({ "n" }, "<CR>", [[<Cmd>call ddu#ui#do_action("itemAction")<CR>]], opts)
          vim.keymap.set({ "n" },    "d", [[<Cmd>call ddu#ui#do_action("itemAction", #{name: "delete"})<CR>]], opts)
          vim.keymap.set({ "n" }, "<Space>", [[<Cmd>call ddu#ui#do_action("toggleSelectItem")<CR>]], opts)
          vim.keymap.set({ "n" },    "i", [[<Cmd>call ddu#ui#do_action("openFilterWindow")<CR>]], opts)
          vim.keymap.set({ "n" },    "p", [[<Cmd>call ddu#ui#do_action("togglePreview")<CR>]], opts)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "ddu-ff-filter",
        callback = function()
          local opts = { noremap = true, silent = true, buffer = true }
          vim.keymap.set({ "n", "i" }, "<CR>", [[<Esc><Cmd>close<CR>]], opts)
        end,
      })

      -- https://github.com/hirakiuc/dotfiles/blob/master/files/.vim/rcs/denite.vim
      -- nnoremap [ddu] <Nop>
      vim.keymap.set('n', '[ddu]', '<Nop>')
      -- nmap ` [ddu]
      vim.keymap.set('n', '`', '[ddu]', {remap = true})

      -- nnoremap <silent> [ddu]f :call ddu#start(#{name: "file_rec"})<CR>
      vim.keymap.set('n', '[ddu]f', [[:call ddu#start(#{name: "file_rec"})<CR>]])
      vim.keymap.set('n', '[ddu]b', [[:call ddu#start(#{name: "buffer"})<CR>]])
    end,
  },
}
