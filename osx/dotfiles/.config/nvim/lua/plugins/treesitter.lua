return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local treesitter_config = require("nvim-treesitter.configs")
			treesitter_config.setup({
				auto_install = true,
				ensure_installed = {
					"lua",
					"astro",
					"typescript",
					"javascript",
					"tsx",
					"html",
					"css",
					"python",
					"markdown",
					"json",
					"go",
					"gomod",
					"gowork",
					"gosum",
					"elixir",
					"rust",
				},
				highlight = { enable = true },
				indent = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["as"] = "@statement.outer",
							["is"] = "@statement.inner",
						},
					},
				},
			})
		end,
	},
	{
		"virchau13/tree-sitter-astro",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				multiline_threshold = 1,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}
