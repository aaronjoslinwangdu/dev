vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
    html = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    javascript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
    sh = { "shfmt" },
    go = { "goimports", "gofumpt" },
    elixir = { "mix" },
  },
})

vim.keymap.set("n", "<leader>f", function()
  conform.format({
    timeout_ms = 500,
    lsp_format = "fallback",
  })
end)
