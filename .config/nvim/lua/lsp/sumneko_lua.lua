local root_pattern = require('lspconfig.util').root_pattern
local sumneko_cmd = 'lua-language-server'
local M = require('lua-dev').setup {
  lspconfig = {
    cmd = { sumneko_cmd },
    root_dir = root_pattern('.git', 'init.lua'),
  },
}

return M
