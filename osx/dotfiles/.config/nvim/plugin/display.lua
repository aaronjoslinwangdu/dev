vim.pack.add({
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
})

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

require("lualine").setup({
	options = {
		theme = "jellybeans",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				path = 0,
				file_status = true,
				newfile_status = false,
				shorting_target = 10,
				symbols = {
					modified = "[+]",
					readonly = "[-]",
					unnamed = "[No Name]",
					newfile = "[New]",
				},
			},
		},
		lualine_x = {},
		lualine_y = { "filetype" },
		lualine_z = { "lsp_status" },
	},
})
