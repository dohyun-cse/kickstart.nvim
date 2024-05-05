return {
  {
    'tpope/vim-fugitive',
    config = function()
      require('which-key').register {
        ['<leader>g'] = {
          name = '[G]it',
          s = { '<cmd>tab Git<CR>', '[S]tatus' },
          d = { '<cmd>tab Gvdiffsplit<CR>', '[D]iff' },
          q = { '<cmd>diffoff!<CR>', '[Q]uit' },
        },
      }
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      -- Actions
      require('which-key').register {
        ['<leader>h'] = {
          name = '[H]unk',
          s = { gitsigns.stage_hunk, '+[S]tage' },
          u = { gitsigns.undo_stage_hunk, '+[U]nstage' },
          d = { gitsigns.reset_hunk, '+[D]iscard' },
          p = { gitsigns.preview_hunk, '+[P]review' },
        },
        ['<leader>b'] = {
          name = '[B]uffer',
          s = { gitsigns.stage_buffer, '+[S]tage' },
          u = { gitsigns.undo_stage_buffer, '+[U]nstage' },
          d = { gitsigns.reset_buffer, '+[D]iscard' },
          p = { gitsigns.preview_buffer, '+[P]review' },
        },
        ['[c'] = {
          function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.prev_hunk()
            end
          end,
          'Previous Hunk',
        },
        [']c'] = {
          function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              gitsigns.next_hunk()
            end
          end,
          'Next Hunk',
        },
  { buffer=bufnr}
      }

      require('which-key').register {
        ['<leader>h'] = {
          name = '[H]unk',
          s = {
            function()
              gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
            end,
            '+[S]tage',
          },
          d = {
            function()
              gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
            end,
            '+[D]iscard',
          },
        },
        { mode = 'v', buffer=bufnr},
      }
        end,
      }
    end,
  },
}
