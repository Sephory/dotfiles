local root_pattern = require('lspconfig.util').root_pattern

local pid = vim.fn.getpid()
local omnisharp_bin = vim.fn.expand '~/.omnisharp/OmniSharp.Stdio.Driver/OmniSharp.exe'

local M = {
  cmd = { 'mono', omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
  root_dir = root_pattern('.git', '*.sln'),
}

return M
