---@diagnostic disable
local navigation = function()
  handle { 'move_left', { 'tmux', 'move_left' } }
  handle { 'move_down', { 'tmux', 'move_bottom' } }
  handle { 'move_up', { 'tmux', 'move_top' } }
  handle { 'move_right', { 'tmux', 'move_right' } }
  handle { 'resize_left', { 'tmux', 'resize_left' } }
  handle { 'resize_down', { 'tmux', 'resize_bottom' } }
  handle { 'resize_up', { 'tmux', 'resize_top' } }
  handle { 'resize_right', { 'tmux', 'resize_right' } }

  handle { 'find_files', { 'telescope.builtin', 'find_files' } }
  handle { 'show_file', ':NnnPicker %p' }
  handle { 'file_tree', ':NnnExplorer %p:h' }

  plugin {
    'aserowy/tmux.nvim',
    config = function()
      require('tmux').setup {
        navigation = {
          persist_zoom = true,
        },
        copy_sync = {
          enable = true,
        },
      }
    end,
  }

  plugin {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    },
  }

  plugin {
    'luukvbaal/nnn.nvim',
    config = function()
      local builtin = require('nnn').builtin
      require('nnn').setup {
        replace_netrw = 'picker',
        explorer = {
          width = 36,
        },
        mappings = {
          { '<C-s>', builtin.open_in_split },
          { '<C-v>', builtin.open_in_vsplit },
        },
        windownav = {
          left = '<C-h>',
          right = '<C-l>',
        },
      }
    end,
  }

  plugin 'tpope/vim-obsession'
end

return navigation
