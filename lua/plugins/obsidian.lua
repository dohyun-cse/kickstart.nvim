local obsidian_path = vim.fn.resolve(vim.fn.expand("~/Obsidian"))
return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	event = {
	  "BufReadPre " .. obsidian_path .. "**/*.md",
	  "BufNewFile " .. obsidian_path .. "**/*.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "my_vault",
				path = obsidian_path .. "/my_vault",
			},
		},
    completion = {
    -- Set to false to disable completion.
    nvim_cmp = true,
    -- Trigger completion at 2 chars.
    min_chars = 0,
  },

		-- see below for full list of options 👇
	},
}
