local root_pattern = require('lspconfig.util').root_pattern

local stylua = {
  formatCommand = 'stylua -',
  formatStdin = true,
}

local prettier = {
  formatCommand = 'prettier --stdin-filepath ${INPUT}',
  formatStdin = true,
}

local languages = {
  lua = { stylua },
  typescript = { prettier },
  javascript = { prettier },
  typescriptreact = { prettier },
  javascriptreact = { prettier },
  vue = { prettier },
  json = { prettier },
  html = { prettier },
  yaml = { prettier },
}

local M = {
  init_options = { documentFormatting = true, codeAction = true },
  filetypes = vim.tbl_keys(languages),
  root_dir = root_pattern('.git', 'init.lua', vim.fn.expand '~/.config'),
  settings = {
    rootMarkers = { '.git/' },
    log_level = 1,
    log_file = vim.fn.stdpath 'cache' .. '/efm.log',
    languages = languages,
  },
}

return M
