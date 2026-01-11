return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})

			-- keymaps
			local map = vim.keymap.set
			map("n", "<leader>gb", gitsigns.blame)
			map("n", "<leader>gd", gitsigns.diffthis)
			map("n", "<leader>gh", gitsigns.preview_hunk_inline)
		end,
	},
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup({
        disable_relative_line_numbers = false,
      })
      vim.keymap.set("n", "<leader>gg", neogit.open)
    end
  }
}
