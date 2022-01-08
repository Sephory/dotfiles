local root_pattern = require('lspconfig.util').root_pattern

local pid = vim.fn.getpid()
local omnisharp_bin = vim.fn.expand '~/.dotnet/omnisharp/OmniSharp'

local M = {
  cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
  root_dir = root_pattern('.git', '*.sln'),
}

return M
