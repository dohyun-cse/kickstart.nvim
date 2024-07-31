return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  },
}
