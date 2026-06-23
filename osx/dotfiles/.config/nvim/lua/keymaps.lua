local utils = require("utils")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.keymap.set("n", "<leader>]", ":tabn<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>go", utils.open_selected_region_in_github, {
	desc = "Open currently selected lines in GitHub.",
	noremap = true,
})

vim.keymap.set(
	"n",
	"<leader>yp",
	utils.yank_path,
	{ desc = "Yank relative path from home directory.", noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>o", function()
	utils.insert_lines(0)
end, { desc = "Insert lines below", silent = true })

vim.keymap.set("n", "<leader>O", function()
	utils.insert_lines(1)
end, { desc = "Insert lines above", silent = true })

vim.keymap.set("n", "<leader>;", "A;<Esc>", { desc = "Insert semicolon at end of line.", silent = true })
vim.keymap.set("n", "<leader>,", "A,<Esc>", { desc = "Insert comma at end of line.", silent = true })
