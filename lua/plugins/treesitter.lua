return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "lua", "c", "cpp", "latex", "vim", "vimdoc", "query" },
        -- highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [" tnc"] = { query = "@class.inner", desc = "Next class start" },
              [" tnf"] = { query = "@function.inner", desc = "Next function start" },
              [" tnC"] = { query = "@class.outer", desc = "Next class outer start" },
              [" tnF"] = { query = "@function.outer", desc = "Next function outer start" },
              [" tnb"] = { query = "@block.outer", desc = "Next block start" },
            },
            goto_previous_start = {
              [" tNc"] = { query = "@class.inner", desc = "Previous class start" },
              [" tNf"] = { query = "@function.inner", desc = "Previous function start" },
              [" tNC"] = { query = "@class.outer", desc = "Previous class start" },
              [" tNF"] = { query = "@function.outer", desc = "Previous function start" },
              [" tNb"] = { query = "@block.outer", desc = "Previous block start" },
            },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/playground",
  },
}
