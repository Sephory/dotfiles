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
          vim.g.onedark_toggle_style_keymap = '<leader>vcc'
          require('onedark').setup()
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
