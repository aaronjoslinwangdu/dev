return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
      local gitsigns = require("gitsigns")
      local map = vim.keymap.set

			gitsigns.setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})

			map("n", "<leader>gb", gitsigns.blame)
			map("n", "<leader>gd", gitsigns.diffthis)
      map("n", "<leader>gh", gitsigns.preview_hunk_inline)
		end,
	},
}
