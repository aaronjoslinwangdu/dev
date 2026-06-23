vim.pack.add({
  "https://www.github.com/windwp/nvim-autopairs",
})

require("nvim-autopairs").setup({
	event = "InsertEnter",
	config = true,
})
