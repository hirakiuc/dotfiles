-- core plugins
return {
  -- colorschema
  {
    'rmehri01/onenord.nvim',
    config = function()
      require('onenord').setup({
        theme = nil,
        disable = {
          background = true, -- disable setting the background color
        }
      })
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      }
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>r', builtin.resume, {})

      -- configure fzf-native extension
      local actions = require('telescope.actions')
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          initial_mode = 'normal',
          mappings = {
            i = {
              ["<Esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      })
      telescope.load_extension('fzf')
    end
  },
}
