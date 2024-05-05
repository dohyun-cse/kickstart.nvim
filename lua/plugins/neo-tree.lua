return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('which-key').register {
      ['<leader>e'] = { '<cmd>Neotree filesystem reveal right<CR>', '[E]xplorer' },
    }
  end,
}
