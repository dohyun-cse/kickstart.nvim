return {
  {
    'tpope/vim-fugitive',
    config = function() end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    'sindrets/diffview.nvim',
    config = {
      enhanced_diff_hl = true,
      keymaps = {
        file_panel = {
          { 'n', '<C-c>', '<cmd>DiffviewClose<CR><cmd>Git commit<CR>', { silent = true } },
          { 'n', 'q', '<cmd>DiffviewClose<CR>', { silent = true } },
        },
      },
    },
  },
}
