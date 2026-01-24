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
