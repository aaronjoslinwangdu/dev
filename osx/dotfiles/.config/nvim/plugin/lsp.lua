-- TODO: migrate to built-in LSP features
vim.pack.add({
	"https://www.github.com/williamboman/mason.nvim",
	"https://www.github.com/williamboman/mason-lspconfig.nvim",
	"https://www.github.com/neovim/nvim-lspconfig",
})

local utils = require("utils")

-- TODO: just use the lsp name as the key
local SERVERS = {
	astro = {},
	clangd = {
		cmd = { "clangd", "--log=verbose" },
    filetypes = { "c", "cpp", "h" },
	},
	cssls = {},
	elixirls = {
		flags = {
			debounce_text_changes = 150,
		},
		elixirLS = {
			dialyzerEnabled = false,
			fetchDeps = false,
		},
	},
	eslint = {},
	gopls = {},
	html = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = {
						"vim",
					},
				},
			},
		},
	},
	basedpyright = {
		root_markers = {
			"pyrightconfig.json",
			"pyproject.toml",
		},
		settings = {
			pyright = {
				disableOrganizeImports = true,
			},
			python = {
				analysis = {
					ignore = { "*" },
				},
			},
		},
	},
	ts_ls = {},
	vimls = {},
	rust_analyzer = {
		rust_analyzer = {
			cargo = {
				features = "all",
			},
		},
	},
}

require("mason").setup()
require("mason-lspconfig").setup()

local defaults = {
	-- TODO: this is not great, look into it
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	handlers = {
		["textDocument/hover"] = vim.lsp.buf.hover({ border = "rounded" }),
		["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({ border = "rounded" }),
	},
}

for server, extras in pairs(SERVERS) do
	local opts = utils.merge(defaults, extras or {})
	vim.lsp.config(server, opts)
end

vim.lsp.enable(utils.keys(SERVERS))

vim.o.winborder = "single"
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end)
