vim.pack.add({
	"https://www.github.com/nvim-lua/plenary.nvim",   -- dependency
	"https://www.github.com/sindrets/diffview.nvim",  -- dependency
  "https://www.github.com/NeogitOrg/neogit",
})

local neogit = require("neogit")
neogit.setup({
	disable_relative_line_numbers = false,
})

vim.keymap.set("n", "<leader>gg", neogit.open)
