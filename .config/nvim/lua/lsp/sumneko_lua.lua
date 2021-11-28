local root_pattern = require('lspconfig.util').root_pattern
local sumneko_cmd = vim.fn.stdpath 'data' .. '/lsp/lua-language-server/bin/Linux/lua-language-server'
local M = require('lua-dev').setup {
  lspconfig = {
    cmd = { sumneko_cmd },
    root_dir = root_pattern('.git', 'init.lua'),
  },
}

return M
