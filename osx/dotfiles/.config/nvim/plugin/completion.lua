vim.pack.add({
  "https://www.github.com/hrsh7th/cmp-nvim-lsp",
  "https://www.github.com/hrsh7th/nvim-cmp",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/windwp/nvim-autopairs",
})

local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }, {
    { name = "buffer" },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

require("nvim-autopairs").setup({
  event = "InsertEnter",
  config = true,
})

require("nvim-ts-autotag").setup()
