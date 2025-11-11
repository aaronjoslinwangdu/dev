return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-python")({
					args = { "--log-level", "DEBUG" },
				}),
			},
			output = {
				open_on_run = false,
			},
			output_panel = {
				open = "botright split | resize 20",
			},
		})

		-- keymaps
		local map = vim.keymap.set
		map("n", "<leader>tt", function()
			neotest.output_panel.clear()
			neotest.run.run()
		end)
		map("n", "<leader>tf", function()
			neotest.output_panel.clear()
			local filepath = vim.fn.expand("%:~")
			neotest.run.run(filepath)
		end)
		map("n", "<leader>to", function()
			neotest.output.open({
				short = true,
				enter = true,
				last_run = true,
				auto_close = true,
			})
		end)
		map("n", "<leader>tw", neotest.output_panel.open)
		map("n", "<leader>tc", neotest.output_panel.clear)
	end,
}
