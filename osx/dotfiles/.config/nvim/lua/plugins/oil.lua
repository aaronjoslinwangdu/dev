return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")

		oil.setup({
			view_options = {
				show_hidden = true,
			},
			lsp_file_methods = {
				timeout_ms = 5000,
			},
		})

		vim.keymap.set("n", "-", oil.open)
	end,
}
