return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        visible = true,
        hide_gitignored = true,
        never_show = { ".git" },
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right<CR>')
  end
}
