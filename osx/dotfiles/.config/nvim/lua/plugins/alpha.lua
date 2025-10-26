return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- header
		dashboard.section.header.val = {
			[[                                                                  ]],
			[[     _/      _/                      _/      _/  _/               ]],
			[[    _/_/    _/    _/_/      _/_/    _/      _/      _/_/_/  _/_/  ]],
			[[   _/  _/  _/  _/_/_/_/  _/    _/  _/      _/  _/  _/    _/    _/ ]],
			[[  _/    _/_/  _/        _/    _/    _/  _/    _/  _/    _/    _/  ]],
			[[ _/      _/    _/_/_/    _/_/        _/      _/  _/    _/    _/   ]],
			[[                                                                  ]],
		}

		-- buttons
		dashboard.section.buttons.val = {
			dashboard.button("e", "    New", ":ene <BAR> startinsert <CR>"),
			dashboard.button("LDR SR", "    Recent", "<leader>sr<CR>"),
			dashboard.button("LDR SF", "󰱽    Files", "<leader>sf<CR>"),
			dashboard.button("LDR SG", "󰊄    Grep", "<leader>sg<CR>"),
			dashboard.button("LDR SB", "    Buffer", "<leader>sb<CR>"),
		}

		-- layout
		dashboard.config = {
			layout = {
				{ type = "padding", val = 10 },
				dashboard.section.header,
				{ type = "padding", val = 6 },
				dashboard.section.buttons,
			},
		}

		alpha.setup(dashboard.config)
	end,
}
