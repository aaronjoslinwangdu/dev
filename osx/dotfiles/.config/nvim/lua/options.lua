local utils = require("utils")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.cmd("set inccommand=split")
vim.cmd("set noswf")

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.confirm = true
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>Q", vim.cmd.copen, { silent = true })
vim.keymap.set("n", "<leader>q", vim.cmd.cclose, { silent = true })
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch, { silent = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true })
vim.keymap.set("n", "<leader>[", ":tabp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>]", ":tabn<CR>", { noremap = true, silent = true })

-- open currently selected lines in github
vim.keymap.set({ "n", "v" }, "<leader>go", utils.open_selected_region_in_github, { noremap = true })

-- yank relative path from home directory
vim.keymap.set("n", "<leader>yp", function()
	local filepath = vim.fn.expand("%:~") -- current path relative to home directory
	vim.fn.setreg("+", filepath) -- insert into the clipboard register
end, { noremap = true, silent = true })

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
