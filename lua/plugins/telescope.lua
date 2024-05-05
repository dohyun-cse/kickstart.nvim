return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require 'telescope.builtin'
      require('which-key').register {
        s = {
          name = '[S]earch',
          f = { builtin.find_files, '[F]ile' },
          g = { builtin.live_grep, '[G]rep' },
          b = { builtin.buffers, '[B]uffers' },
          h = { builtin.search_history, '[H]istory' },
          k = { builtin.keymaps, '[K]eymaps' },
          l = { builtin.current_buffer_fuzzy_find, '[L]ocal fuzzy find' },
        },
      }
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {},
          },
        },
      }
      require('telescope').load_extension 'ui-select'
    end,
  },
}
