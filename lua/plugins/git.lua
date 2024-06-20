return {
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup({
				keymaps = {
					disable_defaults = false,
					view = { ["q"] = "<cmd>tabc<CR>" },
					diff1 = { ["q"] = "<cmd>tabc<CR>" },
					diff2 = { ["q"] = "<cmd>tabc<CR>" },
					diff3 = { ["q"] = "<cmd>tabc<CR>" },
					diff4 = { ["q"] = "<cmd>tabc<CR>" },
					file_panel = { ["q"] = "<cmd>tabc<CR>" },
					file_history_panel = { ["q"] = "<cmd>tabc<CR>" },
					file_option_panel = { ["q"] = "<cmd>tabc<CR>" },
					option_panel = { ["q"] = "<cmd>tabc<CR>" },
					help_panel = { ["q"] = "<cmd>tabc<CR>" },
				},
				hooks = {
					diff_buf_win_enter = function(bufnr, winid, ctx)
						if ctx.layout_name:match("^diff2") then
							if ctx.symbol == "a" then
								vim.opt_local.winhl = table.concat({
									"DiffAdd:DiffviewDiffAddAsDelete",
									"DiffDelete:DiffviewDiffDelete",
								}, ",")
							elseif ctx.symbol == "b" then
								vim.opt_local.winhl = table.concat({
									"DiffDelete:DiffviewDiffDelete",
								}, ",")
							end
						end
					end,
				},
			})
		end,
	},
	{
		"tpope/vim-fugitive",
	},
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
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
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
			})
		end,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("git_worktree")
		end,
	},
	-- { "rickhowe/diffchar.vim" },
}
