vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Disable arrow keys in all relevant modes
local modes = { "n", "i", "v", "s" }
local keys = { "<Up>", "<Down>", "<Left>", "<Right>" }

for _, mode in pairs(modes) do
  for _, key in pairs(keys) do
    vim.keymap.set(mode, key, "<nop>", { noremap = true, silent = true })
  end
end

vim.keymap.set('n', '<Space>', '<NoP>', { noremap = true, silent = true })
