return {

	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
		opts = {
			rocks = { "magick" },
		},
	},
	{
		"3rd/image.nvim",
		dependencies = { "luarocks.nvim" },
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim", "image.nvim", "pysan3/neorg-templates", "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope"},
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
          ["external.templates"] = {
          },
					["core.defaults"] = {},
					["core.concealer"] = {
						config = {
							icons = {
								code_block = {
									content_only = true,
									width = "content",
									highlight = "CursorLine",
									conceal = true,
                  padding = {left = 1, right = 1},
									insert_enabled = true,
								},
							},
						},
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
							},
							default_workspace = "notes",
						},
					},
					["core.tempus"] = {},
					["core.syntax"] = {},
					["core.ui.calendar"] = {},
					["core.integrations.telescope"] = {},
				},
			})

			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,
	},
}
