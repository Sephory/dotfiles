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
  handle { 'find_string', { 'telescope.builtin', 'live_grep' } }
  handle { 'show_file', ':NnnPicker %p' }
  handle { 'file_tree', ':NnnExplorer %p:h' }

  handle { 'new_tab', ':tabnew' }
  handle { 'quit_tab', ':tabclose' }
  handle { 'next_tab', ':tabnext' }
  handle { 'prev_tab', ':tabprevious' }
  handle { 'swap_next_tab', ':+tabmove' }
  handle { 'swap_prev_tab', ':-tabmove' }

  handle { 'close_window', ':q'}
  handle { 'horizontal_split', ':split'}
  handle { 'vertical_split', ':vsplit'}

  handle { 'mark_file', { 'harpoon.mark', 'add_file' } }
  handle { 'quick_nav_menu', { 'harpoon.ui', 'toggle_quick_menu' } }
  handle { 'quick_nav_next', { 'harpoon.ui', 'nav_next' } }
  handle { 'quick_nav_prev', { 'harpoon.ui', 'nav_prev' } }
  handle { 'quick_nav_1', { 'harpoon.ui', 'nav_file' }, args = {1} }
  handle { 'quick_nav_2', { 'harpoon.ui', 'nav_file' }, args = {2} }
  handle { 'quick_nav_3', { 'harpoon.ui', 'nav_file' }, args = {3} }
  handle { 'quick_nav_4', { 'harpoon.ui', 'nav_file' }, args = {4} }
  handle { 'quick_nav_5', { 'harpoon.ui', 'nav_file' }, args = {5} }

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
    'ThePrimeagen/harpoon',
    requires = {
      'nvim-lua/plenary.nvim',
    },
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
    config = function()
      local telescope = require 'telescope'

      telescope.setup {
        pickers = {
          find_files = {
            theme = 'dropdown',
            previewer = false,
          },
          lsp_code_actions = {
            theme = 'cursor',
          },
        },
      }

      telescope.load_extension 'fzf'
    end,
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
