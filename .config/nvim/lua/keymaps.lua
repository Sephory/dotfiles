---@diagnostic disable
local keymaps = function()
  submodule {
    'general',
    function()
      register {
        ['<leader>'] = {
          name = 'Leader',
          ['v'] = {
            name = 'Vim',
            ['c'] = {
              name = 'Config',
              ['e'] = { 'edit_config', 'Edit Config' },
              ['r'] = { 'reload_config', 'Reload Config' },
              ['R'] = { 'reload_and_sync', 'Reload Config and Sync Plugins' },
            },
            ['p'] = {
              name = 'Plugins',
              ['s'] = { 'sync_plugins', 'Sync Plugins' },
              ['c'] = { 'compile_plugins', 'Compile Plugins' },
              ['l'] = { 'clean_plugins', 'Clean Plugins' },
            },
          },
          ['n'] = { 'next_tab', 'Next Tab' },
          ['p'] = { 'prev_tab', 'Previous Tab'},
          ['N'] = { 'swap_next_tab', 'Swap Next Tab' },
          ['P'] = { 'swap_prev_tab', 'Swap Previous Tab'}
        },
      }
    end,
  }

  submodule {
    'appearance',
    function()
      register {
        ['<leader>'] = {
          ['H'] = { 'toggle_hlsearch', 'Toggle Search Highlighting' },
          ['z'] = { 'zen_mode', 'Zen Mode' },
        },
      }
    end,
  }

  submodule {
    'motion',
    function()
      register({
        ['<space>'] = {
          name = 'Jump To',
          ['<space>'] = { 'jump_to_line', 'Line' },
          ['w'] = { 'jump_to_word', 'Word' },
          ['f'] = { 'jump_to_char', 'Character' },
          ['/'] = { 'jump_search', 'Search Pattern' },
        },
      }, { mode = '' })

      register({
        [';'] = {
          name = 'Fancy Motions',
          ['w'] = { 'camel_case_w', 'CamelCase Word' },
          ['e'] = { 'camel_case_e', 'CamelCase End' },
          ['b'] = { 'camel_case_b', 'CamelCase Back' },
          ['g'] = {
            name = 'Go',
            ['e'] = { 'camel_case_ge', 'CamelCase End Back' },
          },
          ['c'] = { 'ts_next_call', 'Next Call' },
          ['C'] = { 'ts_prev_call', 'Previous Call' },
          ['f'] = { 'ts_next_function', 'Next Function' },
          ['F'] = { 'ts_prev_function', 'Previous Function' },
          ['a'] = { 'ts_next_parameter', 'Next Argument' },
          ['A'] = { 'ts_prev_parameter', 'Previous Argument' },
          ['j'] = { 'ts_next_block', 'Next Block' },
          ['k'] = { 'ts_prev_block', 'Previous Block' },
        },
      }, { mode = '' })

      register({
        ['i'] = {
          [';'] = {
            name = 'Fancy Motions',
            ['w'] = { 'camel_case_iw', 'Inside CamelCase Word' },
            ['e'] = { 'camel_case_ie', 'Inside CamelCase Word End' },
            ['f'] = { 'ts_in_function', 'Inside Function' },
            ['c'] = { 'ts_in_call', 'Inside Call' },
            ['a'] = { 'ts_in_parameter', 'Inside Argument' },
            ['b'] = { 'ts_in_block', 'Inside Block' },
          },
        },
        ['a'] = {
          [';'] = {
            name = 'Fancy Motions',
            ['f'] = { 'ts_around_function', 'Around Function' },
            ['c'] = { 'ts_around_call', 'Around Call' },
            ['a'] = { 'ts_around_parameter', 'Around Argument' },
            ['b'] = { 'ts_around_block', 'Around Block' },
          },
        },
      }, { mode = 'o' })

      map { 'f', 'jump_forward_line_char', mode = '' }
      map { 'F', 'jump_back_line_char', mode = '' }
    end,
  }

  submodule {
    'navigation',
    function()
      map { '<C-h>', 'move_left' }
      map { '<C-j>', 'move_down' }
      map { '<C-k>', 'move_up' }
      map { '<C-l>', 'move_right' }
      map { '<M-h>', 'resize_left' }
      map { '<M-j>', 'resize_down' }
      map { '<M-k>', 'resize_up' }
      map { '<M-l>', 'resize_right' }
      map { '<C-p>', 'find_files' }
      map { '-', 'show_file' }
      map { '<C-b>', 'file_tree' }
    end,
  }

  submodule {
    'completion',
    function()
      map { '<C-space>', 'complete', mode = 'i' }
      map { '<CR>', 'confirm' }
      map { '<C-e>', 'cancel', mode = 'i' }
      map { '<S-Tab>', 'prev_item', mode = 'i' }
      map { '<Tab>', 'next_item', mode = 'i' }
    end,
  }

  submodule {
    'lsp',
    function(bufnr)
      map { '<C-k>', 'signature_help', buffer = bufnr, mode = 'i' }
      map { 'K', 'hover', buffer = bufnr }

      register({
        ['g'] = {
          ['d'] = { 'definitions', 'Go to Definitions' },
          ['r'] = { 'references', 'Go to References' },
          ['I'] = { 'implementations', 'Go to Implementations' },
        },
      }, { buffer = bufnr })

      register({
        ['<leader>'] = {
          ['F'] = { 'format_file', 'Format File' },
          ['J'] = { 'ts_swap_next_block', 'Swap Next Block' },
          ['K'] = { 'ts_swap_prev_block', 'Swap Previous Block' },
          ['f'] = {
            name = 'Function',
            ['d'] = { 'ts_peek_function', 'Peek Function' },
            ['J'] = { 'ts_swap_next_function', 'Swap Next Function' },
            ['K'] = { 'ts_swap_prev_function', 'Swap Previous Function' },
          },
          ['c'] = {
            name = 'Class',
            ['d'] = { 'ts_peek_class', 'Peek Class' },
            ['J'] = { 'ts_swap_next_class', 'Swap Next Class' },
            ['K'] = { 'ts_swap_prev_class', 'Swap Previous Class' },
          },
          ['a'] = {
            name = 'Argument',
            ['J'] = { 'ts_swap_next_parameter', 'Swap Next Argument' },
            ['K'] = { 'ts_swap_prev_parameter', 'Swap Previous Argument' },
          },
        },
      }, { buffer = bufnr, mode = 'n' })

      register({
        ['<space>'] = { 'code_action', 'Code Action' },
        ['r'] = { 'rename', 'Rename' },
        ['d'] = {
          name = 'Diagnostics',
          ['l'] = { 'line_diagnostics', 'Line Diagnostics' },
          ['d'] = { 'document_diagnostics', 'Document Diagnostics' },
          ['w'] = { 'workspace_diagnostics', 'Workspace Diagnostics' },
          ['p'] = { 'prev_diagnostic', 'Previous Diagnostic' },
          ['n'] = { 'next_diagnostic', 'Next Diagnostic' },
        },
        ['s'] = {
          name = 'Symbols',
          ['d'] = { 'document_symbols' },
          ['w'] = { 'workspace_symbols' },
        },
        ['l'] = {
          name = 'LSP',
          ['i'] = { 'language_server_info', 'Server Info' },
          ['r'] = { 'restart_language_server', 'Restart Server' },
        },
        ['g'] = {
          name = 'Peek',
          ['f'] = { 'ts_peek_function', 'Peek Function' },
          ['c'] = { 'ts_peek_class', 'Peek Class' },
        },
      }, { prefix = '<leader>', buffer = bufnr })
    end,
  }
end

return keymaps
