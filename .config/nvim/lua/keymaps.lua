---@diagnostic disable
local keymaps = function()
  register({
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
        ['x'] = { 'clear_hidden_buffers', 'Close Hidden Buffers' },
      },
    },
  }, { module = 'general' })

  register({
    ['<leader>'] = {
      ['H'] = { 'toggle_hlsearch', 'Toggle Search Highlighting' },
      ['z'] = { 'zen_mode', 'Zen Mode' },
    },
  }, { module = 'appearance' })

  register({
    ['<space>'] = {
      name = 'Jump To',
      ['<space>'] = { 'jump_to_word', 'Word' },
      ['k'] = { 'jump_to_line_up', 'Up' },
      ['j'] = { 'jump_to_line_down', 'Down' },
      ['f'] = { 'jump_to_char', 'Character' },
      ['/'] = { 'jump_search', 'Search Pattern' },
    },
  }, { mode = '', module = 'motion' })

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
      ['h'] = { 'git_next_hunk', 'Next Hunk' },
      ['H'] = { 'git_prev_hunk', 'Previous Hunk' },
    },
  }, { mode = '', module = 'motion' })

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
  }, { mode = 'o', module = 'motion' })

  map { 'f', 'jump_forward_line_char', mode = '', module = 'motion' }
  map { 'F', 'jump_back_line_char', mode = '', module = 'motion' }

  map { '<C-h>', 'move_left', module = 'navigation' }
  map { '<C-j>', 'move_down', module = 'navigation' }
  map { '<C-k>', 'move_up', module = 'navigation' }
  map { '<C-l>', 'move_right', module = 'navigation' }
  map { '<M-h>', 'resize_left', module = 'navigation' }
  map { '<M-j>', 'resize_down', module = 'navigation' }
  map { '<M-k>', 'resize_up', module = 'navigation' }
  map { '<M-l>', 'resize_right', module = 'navigation' }
  map { '<C-p>', 'find_files', module = 'navigation' }
  map { '<C-f>', 'find_string', module = 'navigation' }
  map { '-', 'show_file', module = 'navigation' }
  map { '<C-b>', 'file_tree', module = 'navigation' }
  register({
    ["'"] = {
      name = 'Navigation',
      ['<space>'] = { 'mark_file', 'Mark File' },
      ["'"] = { 'quick_nav_menu', 'Mark Menu' },
      ['j'] = { 'quick_nav_next', 'Next Marked File' },
      ['k'] = { 'quick_nav_prev', 'Previous Marked File' },
      ['1'] = { 'quick_nav_1', 'Mark 1' },
      ['2'] = { 'quick_nav_2', 'Mark 2' },
      ['3'] = { 'quick_nav_3', 'Mark 3' },
      ['4'] = { 'quick_nav_4', 'Mark 4' },
      ['5'] = { 'quick_nav_5', 'Mark 5' },
      ['s'] = { 'horizontal_split', 'Split Horizontally' },
      ['v'] = { 'vertical_split', 'Split Vertically' },
      ['q'] = { 'close_window', 'Quit Window' },
      ['t'] = {
        name = 'Tabs',
        ['n'] = { 'new_tab', 'New Tab' },
        ['q'] = { 'quit_tab', 'Quit Tab' },
      },
      ['l'] = { 'next_tab', 'Next Tab' },
      ['h'] = { 'prev_tab', 'Previous Tab' },
      ['L'] = { 'swap_next_tab', 'Swap Next Tab' },
      ['H'] = { 'swap_prev_tab', 'Swap Previous Tab' },
    },
  }, { module = 'navigation' })

  map { '<C-space>', 'complete', mode = 'i', module = 'completion' }
  map { '<CR>', 'confirm', mode = 'i', module = 'completion' }
  map { '<C-e>', 'cancel', mode = 'i', module = 'completion' }
  map { '<S-Tab>', 'prev_item', mode = 'i', module = 'completion' }
  map { '<Tab>', 'next_item', mode = 'i', module = 'completion' }

  register({
    ['<leader>'] = {
      ['g'] = {
        name = 'Git',
        ['k'] = { 'git_preview_hunk', 'Preview Hunk' },
        ['R'] = { 'git_reset_hunk', 'Reset Hunk' },
        ['d'] = { 'git_diff', 'Diff' },
      },
    },
  }, { module = 'git' })

  submodule {
    'buffer_lsp',
    function()
      map { '<C-k>', 'signature_help', buffer = bufnr, mode = 'i', module = 'lsp' }
      map { 'K', 'hover', buffer = bufnr, module = 'lsp' }

      register({
        ['g'] = {
          ['d'] = { 'definitions', 'Go to Definitions' },
          ['r'] = { 'references', 'Go to References' },
          ['I'] = { 'implementations', 'Go to Implementations' },
        },
      }, { buffer = bufnr, module = 'lsp' })

      register({
        ['<leader>'] = {
          ['F'] = { 'format_file', 'Format File' },
        },
      }, { buffer = bufnr, mode = 'n', module = 'lsp' })

      register({
        ['<space>'] = { 'code_action', 'Code Action' },
        ['r'] = { 'rename', 'Rename' },
        ['d'] = {
          name = 'Diagnostics',
          ['l'] = { 'line_diagnostics', 'Line Diagnostics' },
          ['d'] = { 'document_diagnostics', 'Document Diagnostics' },
          ['p'] = { 'prev_diagnostic', 'Previous Diagnostic' },
          ['n'] = { 'next_diagnostic', 'Next Diagnostic' },
        },
        ['s'] = {
          name = 'Symbols',
          ['d'] = { 'document_symbols' },
          ['w'] = { 'workspace_symbols' },
        },
        ['v'] = {
          ['l'] = {
            name = 'LSP',
            ['i'] = { 'language_server_info', 'Server Info' },
            ['r'] = { 'restart_language_server', 'Restart Server' },
          },
        },
      }, { prefix = '<leader>', buffer = bufnr, module = 'lsp' })
    end,
  }
end

return keymaps
