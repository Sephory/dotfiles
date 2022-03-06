---@diagnostic disable
local git = function()
  plugin 'tpope/vim-fugitive'

  submodule {
    'gitsigns',
    function()
      handle { 'git_preview_hunk', ':Gitsigns preview_hunk'}
      handle { 'git_reset_hunk', ':Gitsigns reset_hunk'}
      handle { 'git_diff', ':Gitsigns diffthis'}

      plugin {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
          require('gitsigns').setup {
            keymaps = {},
          }
        end,
      }
    end,
  }
end

return git
