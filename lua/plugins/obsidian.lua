return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	-- lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "~/Obsidian/**.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "Main Vault",
				path = "~/Obsidian/Zettlekasten",
			},
		},
		templates = {
			folder = "~/.config/nvim/templates",
		},
		-- see below for full list of options 👇
	},
	config = function()
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = "*.md",
			callback = function()
				vim.cmd("set conceallevel=2")
			end,
		})

		vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
			pattern = "*.md",
			callback = function()
				vim.cmd("set conceallevel=0")
			end,
		})
	end,
}
