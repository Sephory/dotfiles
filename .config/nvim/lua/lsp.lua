---@diagnostic disable
local lsp = function()
  handle { 'hover', { 'vim.lsp.buf', 'hover' } }
  handle { 'signature_help', { 'vim.lsp.buf', 'signature_help' } }
  handle { 'rename', { 'vim.lsp.buf', 'rename' } }
  handle { 'line_diagnostics', { 'vim.diagnostic', 'open_float' }, args = { 0, { focusable = false } } }
  handle { 'code_action', { 'vim.lsp.buf', 'code_action' } }
  handle { 'next_diagnostic', { 'vim.diagnostic', 'goto_next' } }
  handle { 'prev_diagnostic', { 'vim.diagnostic', 'goto_prev' } }
  handle { 'restart_language_server', ':LspRestart' }
  handle { 'language_server_info', ':LspInfo' }

  handle {
    'ts_peek_function',
    { 'nvim-treesitter.textobjects.lsp_interop', 'peek_definition_code', args = { '@function.outer' } },
  }
  handle {
    'ts_peek_class',
    { 'nvim-treesitter.textobjects.lsp_interop', 'peek_definition_code', args = { '@class.outer' } },
  }

  handle { 'ts_swap_next_class', { 'nvim-treesitter.textobjects.swap', 'swap_next' }, args = { '@class.outer' } }
  handle { 'ts_swap_prev_class', { 'nvim-treesitter.textobjects.swap', 'swap_previous' }, args = { '@class.outer' } }
  handle { 'ts_swap_next_function', { 'nvim-treesitter.textobjects.swap', 'swap_next' }, args = { '@function.outer' } }
  handle {
    'ts_swap_prev_function',
    { 'nvim-treesitter.textobjects.swap', 'swap_previous' },
    args = { '@function.outer' },
  }
  handle { 'ts_swap_next_block', { 'nvim-treesitter.textobjects.swap', 'swap_next' }, args = { '@block.outer' } }
  handle { 'ts_swap_prev_block', { 'nvim-treesitter.textobjects.swap', 'swap_previous' }, args = { '@block.outer' } }
  handle {
    'ts_swap_next_parameter',
    { 'nvim-treesitter.textobjects.swap', 'swap_next' },
    args = { '@parameter.inner' },
  }
  handle {
    'ts_swap_prev_parameter',
    { 'nvim-treesitter.textobjects.swap', 'swap_previous' },
    args = { '@parameter.inner' },
  }

  handle { 'format_file', { 'vim.lsp.buf', 'formatting' } }

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = false, underline = true }
  )
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' })
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'single',
  })

  local gutter_signs = {
    Error = '',
    Warn = '',
    Hint = '',
    Info = '',
  }

  for type, icon in pairs(gutter_signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  plugin {
    'neovim/nvim-lspconfig',
    requires = { 'folke/lua-dev.nvim' },
    config = function()
      local lspconfig = require 'lspconfig'
      local decoupled = require 'decoupled'

      local on_attach = function(client, bufnr)
        decoupled.activate('keymaps', 'lsp', bufnr)
        vim.cmd [[
          aug LspBuffer
            au! * <buffer>
            au CursorHold <buffer> lua vim.diagnostic.open_float( 0, { focusable = false, show_header = false, scope = 'line' })
          aug END
        ]]
      end

      local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

      local servers = require 'lsp.base_servers'
      servers['omnisharp'] = require 'lsp.omnisharp'
      servers['sumneko_lua'] = require 'lsp.sumneko_lua'
      servers['efm'] = require 'lsp.efm'
      servers['volar'] = require 'lsp.volar'

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        config.on_attach = on_attach
        lspconfig[server].setup(config)
      end
    end,
  }

  plugin {
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup {}
    end
  }

  submodule {
    'telescope',
    function()
      handle { 'definitions', { 'telescope.builtin', 'lsp_definitions' } }
      handle { 'references', { 'telescope.builtin', 'lsp_references' } }
      handle { 'implementations', { 'telescope.builtin', 'lsp_implementations' } }
      handle { 'document_diagnostics', { 'telescope.builtin', 'lsp_document_diagnostics' } }
      handle { 'workspace_diagnostics', { 'telescope.builtin', 'lsp_workspace_diagnostics' } }
      handle { 'document_symbols', { 'telescope.builtin', 'lsp_document_symbols' } }
      handle { 'workspace_symbols', { 'telescope.builtin', 'lsp_dynamic_workspace_symbols' } }
    end,
  }
end

return lsp