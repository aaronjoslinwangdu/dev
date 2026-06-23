vim.pack.add({
  "https://www.github.com/lewis6991/gitsigns.nvim",
})

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

vim.keymap.set("n", "<leader>gb", gitsigns.blame)
vim.keymap.set("n", "<leader>gd", gitsigns.diffthis)
vim.keymap.set("n", "<leader>gh", gitsigns.preview_hunk_inline)
