local function bootstrap()
  local fn = vim.fn
  local install_path = fn.stdpath 'data' .. '/site/pack/decoupled/start/decoupled.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/sephory/decoupled.nvim', install_path }
    vim.cmd [[packadd decoupled.nvim]]
  end
end

bootstrap()
local decoupled = require 'decoupled'

decoupled.setup()

local config_modules = {
  'general',
  'appearance',
  'motion',
  'navigation',
  'completion',
  'treesitter',
  'lsp',
  'git',
  'keymaps',
}

local config_submodules = {
  'onedark',
  'telescope'
}


decoupled.start(config_modules, config_submodules)
