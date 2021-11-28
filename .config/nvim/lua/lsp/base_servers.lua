local M = {}

local servers = { 'cssls', 'html', 'jsonls', 'eslint', 'clangd' }

for _, server in ipairs(servers) do
  M[server] = {
    flags = {
      debounce_text_changes = 150,
    },
  }
end

return M
