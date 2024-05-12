return {
  {
    -- You need to install lazygit and git-delta
    -- with your package manager, e.g., homebrew
    -- After lazygit plugin is installed,
    -- type `:LazyGitConfig<CR>`
    -- and write the following in the config file.
    -- ```
    -- git:
    -- paging:
    --   colorArg: always
    --   pager: delta --paging=never
    -- ```
    -- To make this pager as default, use the following command
    -- `git config --global core.pager 'delta'`
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
        -- on_attach = function(bufnr)
        --   vim.keymap.set('n', '<esc>', function()
        --     for _, id in ipairs(vim.api.nvim_list_wins()) do
        --       if vim.api.nvim_win_get_config(id).relative ~= '' then
        --         vim.api.nvim_win_close(id, false)
        --       end
        --     end
        --   end, { buffer = bufnr })
        -- end,
      }
    end,
  },
  { 'rickhowe/diffchar.vim' }
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
