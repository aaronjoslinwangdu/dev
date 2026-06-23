vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/ibhagwan/fzf-lua",
  "https://github.com/stevearc/oil.nvim",
})

local fzf = require("fzf-lua")
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

vim.keymap.set("n", "<leader>sf", fzf.files)
vim.keymap.set("n", "<leader>sr", fzf.oldfiles)
vim.keymap.set("n", "<leader>sb", fzf.buffers)
vim.keymap.set("n", "<leader>sg", fzf.grep)
vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions)
vim.keymap.set("n", "<leader>fu", fzf.lsp_references)
vim.keymap.set("n", "gd", fzf.lsp_definitions)
vim.keymap.set("n", "gt", fzf.lsp_typedefs)

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
