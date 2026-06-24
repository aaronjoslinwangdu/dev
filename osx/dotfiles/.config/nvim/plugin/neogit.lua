vim.pack.add({
	"https://www.github.com/nvim-lua/plenary.nvim",   -- dependency
	"https://www.github.com/sindrets/diffview.nvim",  -- dependency
  "https://www.github.com/NeogitOrg/neogit",
})

local neogit = require("neogit")
neogit.setup({
  treesitter_diff_highlight = true,
  word_diff_highlight = true,
  process_spinner = true,
	disable_relative_line_numbers = false,
  integrations = {
    diffview = true,
    fzf_lua = true,
  }
})

vim.keymap.set("n", "<leader>gg", neogit.open)
