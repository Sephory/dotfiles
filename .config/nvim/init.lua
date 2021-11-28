local decoupled = require 'decoupled'

decoupled.setup()

local config_modules = {
  { 'general', {
    'telescope',
  } },
  { 'appearance', {
    'tokyonight',
  } },
  'motion',
  'navigation',
  'completion',
  'treesitter',
  { 'lsp', {
    'telescope',
  } },
  'git',
  {
    'keymaps',
    {
      'general',
      'appearance',
      'motion',
      'navigation',
      'completion',
    },
  },
}

decoupled.start(config_modules)
