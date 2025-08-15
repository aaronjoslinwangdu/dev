return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { bold = false, italic = false },

				colors = {
					palette = { peachRed = "#E46876" },
				},

				overrides = function(colors)
					local theme = colors.theme
					local makeDiagnosticColor = function(color)
						local c = require("kanagawa.lib.color")
						return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
					end
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
						DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
						DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
						DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
					}
				end,
			})

			vim.cmd.colorscheme("kanagawa")
		end,
	},
}
