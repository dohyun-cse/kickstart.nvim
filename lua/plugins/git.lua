return {
  -- {
  --   'tpope/vim-fugitive',
  --   config = function() end,
  -- },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        current_line_blame = true,
      }
    end,
  },
  -- {
  --   'sindrets/diffview.nvim',
  --   dependencies = { 'tpope/vim-fugitive' },
  --   config = {
  --     enhanced_diff_hl = true,
  --     keymaps = {
  --       file_panel = {
  --         { 'n', '<C-c>', '<cmd>DiffviewClose<CR><cmd>Git commit<CR>', { desc = 'Commit', silent = true } },
  --         { 'n', 'q', '<cmd>DiffviewClose<CR>', { desc = 'Close Diffview', silent = true } },
  --       },
  --     },
  --   },
  -- },
}
