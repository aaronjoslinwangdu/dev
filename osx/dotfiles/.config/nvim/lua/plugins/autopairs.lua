  return {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        event = "InsertEnter",
        config = true,
      })
    end,
  }
