---@diagnostic disable
local appearance = function()
  o.termguicolors = true
  o.number = true
  o.relativenumber = true
  o.signcolumn = 'yes:1'
  o.showmode = false
  o.scrolloff = 8
  o.hlsearch = false
  o.cursorline = true

  handle {
    'toggle_hlsearch',
    function()
      vim.o.hlsearch = not vim.o.hlsearch
    end,
  }

  handle { 'zen_mode', ':ZenMode' }

  handle {
    'active_window',
    function()
      local wo = vim.wo
      wo.cursorline = true
      wo.relativenumber = true

      local f_name, f_extension = vim.fn.expand '%:t', vim.fn.expand '%:e'
      local devicons_loaded, devicons = pcall(require, 'nvim-web-devicons')
      if f_name ~= '' then
        if devicons_loaded then
          local icon = devicons.get_icon(f_name, f_extension)
        end
        local title = (icon or '') .. ' ' .. f_name
        vim.o.titlestring = title
      end
    end,
  }

  handle {
    'inactive_window',
    function()
      local wo = vim.wo
      wo.cursorline = false
      wo.relativenumber = false
    end,
  }

  vim.cmd [[
    aug ActiveWindow
      au!
      au BufWinEnter * lua require('decoupled').call_handler('appearance', 'active_window')
      au WinEnter * lua require('decoupled').call_handler('appearance', 'active_window')
      au WinLeave * lua require('decoupled').call_handler('appearance', 'inactive_window')
    aug END
  ]]

  plugin {
    'nvim-lualine/lualine.nvim',
    as = 'lualine',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    },
    config = function()
      require('lualine').setup {
        options = { theme = 'auto' },
        inactive_sections = {
          lualine_c = { { 'filename', path = 1 } },
        },
      }
    end,
  }

  plugin {
    'alvarosevilla95/luatab.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('luatab').setup {}
    end,
  }

  plugin {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }

  plugin {
    'lukas-reineke/indent-blankline.nvim',
    as = 'blankline',
    config = function()
      vim.opt.list = true
      vim.opt.listchars = 'eol:↴'
      local blankline = require 'indent_blankline'
      blankline.setup {
        show_current_context = true,
      }
    end,
  }

  plugin {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup {
        window = {
          backdrop = 0.75,
          width = 120,
          options = {
            list = false,
            cursorline = false,
          },
        },
        plugins = {
          tmux = {
            enabled = true,
          },
        },
      }
    end,
  }

  plugin {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup {
        dimming = {
          alpha = 0.5,
        },
      }
    end,
  }

  submodule {
    'onedark',
    function()
      plugin {
        'navarasu/onedark.nvim',
        after = { 'lualine', 'blankline' },
        config = function()
          require('onedark').setup {
            style = 'darker',
            toggle_style_key = '<leader>vcc',
          }
          vim.cmd [[colorscheme onedark]]
        end,
      }
    end,
  }

  submodule {
    'tokyonight',
    function()
      plugin {
        'folke/tokyonight.nvim',
        after = { 'lualine', 'blankline' },
        config = function()
          vim.cmd [[colorscheme tokyonight]]
        end,
      }
    end,
  }

  submodule {
    'gruvbox',
    function()
      plugin {
        'ellisonleao/gruvbox.nvim',
        after = { 'lualine', 'blankline' },
        requires = 'rktjmp/lush.nvim',
        config = function()
          vim.cmd [[colorscheme gruvbox]]
        end,
      }
    end,
  }
end

return appearance
