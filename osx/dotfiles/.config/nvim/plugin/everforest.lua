vim.pack.add({
  "https://github.com/neanias/everforest-nvim",
})

require("everforest").setup({
  background = "soft",
  ui_contrast = "high",
  colours_override = function(palette)
    palette.green = "#456dc4"
    palette.yellow = "#3b9485"
    palette.blue = "#c7566c"
    palette.orange = "#7f5ba6"
    palette.red = "#d97025"
  end
})
vim.o.background = "light"
vim.cmd("colorscheme everforest")
