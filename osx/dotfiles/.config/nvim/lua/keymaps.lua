local utils = require("utils")

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
  vim.fn.setreg("+", filepath)         -- insert into the clipboard register
end, { noremap = true, silent = true })
