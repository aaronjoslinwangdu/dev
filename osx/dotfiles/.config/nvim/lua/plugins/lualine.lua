return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
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
	end,
}
