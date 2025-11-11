return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})

			-- keymaps
			local map = vim.keymap.set
			map("n", "<leader>gb", gitsigns.blame)
			map("n", "<leader>gd", gitsigns.diffthis)
			map("n", "<leader>gh", gitsigns.preview_hunk_inline)
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- dependencies = {
		-- 	"nvim-lua/plenary.nvim",
		-- },
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
