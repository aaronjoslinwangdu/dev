vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.cmd("set inccommand=split")
vim.cmd("set noswf")

vim.g.c_syntax_for_h = 1

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.confirm = true
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamedplus"
vim.opt.winborder = "single"


-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
