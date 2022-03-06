---@diagnostic disable
local motion = function()
  handle { 'camel_case_w', '<Plug>CamelCaseMotion_w' }
  handle { 'camel_case_e', '<Plug>CamelCaseMotion_e' }
  handle { 'camel_case_b', '<Plug>CamelCaseMotion_b' }
  handle { 'camel_case_ge', '<Plug>CamelCaseMotion_ge' }

  handle { 'camel_case_iw', '<Plug>CamelCaseMotion_iw' }
  handle { 'camel_case_ie', '<Plug>CamelCaseMotion_ie' }

  handle { 'ts_next_call', { 'nvim-treesitter.textobjects.move', 'goto_next_start' }, args = { '@call.outer' } }
  handle { 'ts_prev_call', { 'nvim-treesitter.textobjects.move', 'goto_previous_start' }, args = { '@call.outer' } }
  handle { 'ts_next_function', { 'nvim-treesitter.textobjects.move', 'goto_next_start' }, args = { '@function.outer' } }
  handle { 'ts_prev_function', { 'nvim-treesitter.textobjects.move', 'goto_previous_start' }, args = { '@function.outer' } }
  handle { 'ts_next_block', { 'nvim-treesitter.textobjects.move', 'goto_next_start' }, args = { '@block.outer' } }
  handle { 'ts_prev_block', { 'nvim-treesitter.textobjects.move', 'goto_previous_start' }, args = { '@block.outer' } }
  handle { 'ts_next_parameter', { 'nvim-treesitter.textobjects.move', 'goto_next_start' }, args = { '@parameter.inner' } }
  handle { 'ts_prev_parameter', { 'nvim-treesitter.textobjects.move', 'goto_previous_start' }, args = { '@parameter.inner' } }

  handle { 'ts_in_function', { 'nvim-treesitter.textobjects.select', 'select_textobject' }, args = { '@function.inner' } }
  handle { 'ts_around_function', { 'nvim-treesitter.textobjects.select', 'select_textobject' }, args = { '@function.outer' } }
  handle { 'ts_in_call', { 'nvim-treesitter.textobjects.select', 'select_textobject' }, args = { '@call.inner' } }
  handle { 'ts_around_call', { 'nvim-treesitter.textobjects.select', 'select_textobject' }, args = { '@call.outer' } }
  handle { 'ts_in_block', { 'nvim-treesitter.textobjects.select', 'select_textobject' }, args = { '@block.inner' } }
  handle { 'ts_around_block', { 'nvim-treesitter.textobjects.select', 'select_textobject' }, args = { '@block.outer' } }
  handle { 'ts_in_parameter', { 'nvim-treesitter.textobjects.select', 'select_textobject' }, args = { '@parameter.inner' } }
  handle { 'ts_around_parameter', { 'nvim-treesitter.textobjects.select', 'select_textobject' }, args = { '@parameter.outer' } }

  handle { 'jump_to_line_up', ':HopLineStartBC' }
  handle { 'jump_to_line_down', ':HopLineStartAC' }
  handle { 'jump_to_word', ':HopWord' }
  handle { 'jump_to_char', ':HopChar1' }
  handle { 'jump_search', ':HopPattern' }
  handle { 'jump_forward_line_char', ':HopChar1CurrentLineAC' }
  handle { 'jump_back_line_char', ':HopChar1CurrentLineBC' }

  plugin {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup {}
    end,
  }

  plugin 'wellle/targets.vim'
  plugin 'bkad/CamelCaseMotion'
  plugin 'tpope/vim-surround'

  submodule {
    'gitsigns',
    function()
      handle { 'git_next_hunk', ':Gitsigns next_hunk'}
      handle { 'git_prev_hunk', ':Gitsigns prev_hunk'}
    end
  }
end

return motion
