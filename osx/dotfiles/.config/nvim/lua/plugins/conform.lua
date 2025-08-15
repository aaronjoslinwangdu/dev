return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
					html = { "prettierd", "prettier" },
					css = { "prettierd", "prettier" },
					javascript = { "prettierd", "prettier" },
					javascriptreact = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },
					typescriptreact = { "prettierd", "prettier" },
					astro = { "prettierd", "prettier" },
					json = { "prettierd", "prettier" },
					markdown = { "prettierd", "prettier" },
					sh = { "shfmt" },
				},
			})

			vim.keymap.set("", "<leader>f", function()
				conform.format({
          timeout_ms = 500,
          lsp_format = "fallback",
        })
			end, { desc = "Format code (all modes)" })
		end,
	},
}
