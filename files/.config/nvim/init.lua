-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
vim.o.ambiwidth = 'double'
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.visualbell = true
vim.o.number = true
vim.o.showmatch = true
vim.o.matchtime = 1

-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.api.nvim_set_keymap(
  'n', '<Esc><Esc>', ':nohl<CR>',
  { noremap = true, silent = true }
)

-- manipulation
vim.g.mapleader = '`'
vim.opt.clipboard:append{'unnamedplus'}
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

-- remap for us keyboard
-- noremap ; :
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
-- noremap : ;
vim.api.nvim_set_keymap('n', ':', ';', { noremap = true })

--[[
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
]]

-- init lazy.nvim
require("lazy_nvim")

-- load plugins
require('lazy').setup("plugins")

-- load ftypes settings
require('ftypes/go')
