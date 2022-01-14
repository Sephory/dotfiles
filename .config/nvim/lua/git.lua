---@diagnostic disable
local git = function()
  plugin {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        keymaps = {},
      }
    end,
  }

  plugin 'tpope/vim-fugitive'
end


return git
