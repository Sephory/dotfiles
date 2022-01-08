---@diagnostic disable
local general = function()
  handle { 'edit_config', ':e $MYVIMRC' }
  handle {
    'reload_config',
    function()
      vim.cmd 'so $MYVIMRC'
      require('packer').compile()
    end,
  }
  handle {
    'reload_and_sync',
    function()
      vim.cmd 'so $MYVIMRC'
      require('packer').sync()
    end,
  }

  handle { 'sync_plugins', ':PackerSync' }
  handle { 'compile_plugins', ':PackerCompile' }
  handle { 'clean_plugins', ':PackerClean' }

  vim.cmd [[
    aug General
      au!
      au InsertEnter * set norelativenumber
      au InsertLeave * set relativenumber
  ]]

  o.title = true

  g.loaded_perl_provider = 0
  g.loaded_ruby_provider = 0
  g.loaded_python_provider = 0
  g.loaded_matchit = 1
  g.loaded_netrw = 1
  g.loaded_netrwPlugin = 1

  o.grepprg = 'rg --hidden --vimgrep --smart-case --'

  o.hidden = true
  o.splitbelow = true
  o.splitright = true
  o.mouse = 'a'
  o.updatetime = 250
  o.timeoutlen = 500
  o.wildmode = 'longest,list,full'
  o.wildignorecase = true
  o.ignorecase = true
  o.smartcase = true
  o.formatoptions = ''
  o.shiftwidth = 2
  o.expandtab = true

  plugin 'wbthomason/packer.nvim'
  plugin {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {
        plugins = {
          marks = false
        }
      }

    end
  }
  plugin 'tpope/vim-repeat'
  plugin {
    'editorconfig/editorconfig-vim',
    config = function()
      vim.g.EditorConfig_max_line_indicator = 'fill'
      vim.g.EditorConfig_preserve_formatoptions = 1
    end
  }

  submodule {
    'telescope',
    function()
      handle {
        'edit_config',
        { 'telescope.builtin', 'find_files' },
        args = { { cwd = vim.fn.stdpath 'config' } },
      }
    end,
  }
end

return general
