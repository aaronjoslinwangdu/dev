vim.pack.add({
  "https://www.github.com/nvim-tree/nvim-web-devicons", -- dependency
	"https://www.github.com/ibhagwan/fzf-lua",
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
vim.keymap.set("n", "<leader>sw", fzf.grep_cword)
vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions)
vim.keymap.set("n", "<leader>fu", fzf.lsp_references)
vim.keymap.set("n", "<leader>ss", fzf.lsp_document_symbols)
vim.keymap.set("n", "gd", fzf.lsp_definitions)
vim.keymap.set("n", "gt", fzf.lsp_typedefs)
