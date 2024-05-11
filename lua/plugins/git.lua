return {
  {
    'tpope/vim-fugitive',
    config = function() end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup{
        current_line_blame=true,
      }
    end,
  },
  {
    'sindrets/diffview.nvim',
    dependencies = { 'tpope/vim-fugitive' },
    config = {
      enhanced_diff_hl = true,
      keymaps = {
        file_panel = {
          { 'n', '<C-c>', '<cmd>DiffviewClose<CR><cmd>Git commit<CR>', { desc = 'Commit', silent = true } },
          { 'n', 'q', '<cmd>DiffviewClose<CR>', { desc = 'Close Diffview', silent = true } },
        },
      },
    },
  },
}
