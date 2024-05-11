return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Personal',
        path = '~/vaults/Personal',
      },
      {
        name = 'Work',
        path = '~/vaults/Work',
      },
    },
  },
  config = function()
    require('obsidian').setup {
      picker = { name = 'telescope.nvim', mapping = { insert_link = '<leader>l' } },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      },
    }
  end,
}
