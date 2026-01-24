vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader= " "

-- Disable arrow keys in all relevant modes
local modes = { "n", "i", "v", "s" }
local keys = { "<Up>", "<Down>", "<Left>", "<Right>" }

for _, mode in pairs(modes) do
  for _, key in pairs(keys) do
    vim.keymap.set(mode, key, "<nop>", { noremap = true, silent = true })
  end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
  {
    'nvim-telescope/telescope.nvim', version = '0.2.1',
     dependencies = {
        'nvim-lua/plenary.nvim',
     }
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
  },
}

require("lazy").setup(plugins, opts)

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- npm install -g tree-sitter-cli@0.25.0
require'nvim-treesitter'.setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require'nvim-treesitter'.install { 'lua', 'vim', 'vimdoc','c', 'cpp' }

--keymap for Neotree
vim.keymap.set('n', '<C-n>', ':Neotree toggle right<CR>')

