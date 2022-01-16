---@diagnostic disable
local completion = function()
  handle { 'cancel', { 'cmp', 'close' } }
  handle {
    'next_item',
    function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
      end
    end,
  }
  handle {
    'prev_item',
    function()
      local cmp = require 'cmp'
      if cmp.visible() then
        cmp.select_prev_item()
      else
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, true, true), 'n')
      end
    end,
  }

  plugin {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      {
        'saadparwaiz1/cmp_luasnip',
        requires = { 'L3MON4D3/LuaSnip' },
      },
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      {
        'andersevenrud/cmp-tmux',
      },
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-calc',
      'onsails/lspkind-nvim',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'
      local key = require('decoupled').get_keys 'keymaps'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          {
            name = 'buffer',
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
          { name = 'path' },
          { name = 'tmux' },
          { name = 'nvim_lua' },
          { name = 'calc' },
        },
        formatting = {
          format = lspkind.cmp_format { with_text = false },
        },
        mapping = {
          [key 'confirm'] = cmp.mapping(cmp.mapping.confirm(), { 'i', 'c' }),
          [key 'complete'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        },
      }
    end,
  }

  plugin {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  }
end
return completion
