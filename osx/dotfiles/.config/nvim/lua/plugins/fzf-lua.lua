return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		local map = vim.keymap.set

		fzf.setup({
			oldfiles = {
				include_current_session = true,
				cwd_only = true,
			},
			grep = {
				rg_glob = true,
				glob_flag = "--iglob",
			},
			previewers = {
				builtin = {
					syntax_limit_b = 1024 * 100,
				},
			},
			winopts = {
				fullscreen = true,
				preview = {
					horizontal = "right:50%",
				},
			},
			keymap = {
				fzf = {
					["ctrl-a"] = "select-all+accept",
				},
			},
		})

		-- use for code actions
		fzf.register_ui_select()

		map("n", "<leader>sf", fzf.files)
		map("n", "<leader>sr", fzf.oldfiles)
		map("n", "<leader>sb", fzf.buffers)
		map("n", "<leader>sg", fzf.grep)
		map("n", "<leader>ca", fzf.lsp_code_actions)
		map("n", "fu", fzf.lsp_references)
		map("n", "gd", fzf.lsp_definitions)
	end,
}
