return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- npm install -g tree-sitter-cli@0.25.10
    require'nvim-treesitter'.setup {
      install_dir = vim.fn.stdpath('data') .. '/site'
    }
    require'nvim-treesitter'.install {
      'lua',
      'vim',
      'vimdoc',
      'c',
      'cpp',
      'markdown',
      'markdown_inline',
      'python',
      'zig',
    }
  end
}
