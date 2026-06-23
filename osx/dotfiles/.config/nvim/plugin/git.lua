vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/sindrets/diffview.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/NeogitOrg/neogit",
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


local neogit = require("neogit")
neogit.setup({
	disable_relative_line_numbers = false,
})
vim.keymap.set("n", "<leader>gg", neogit.open)
