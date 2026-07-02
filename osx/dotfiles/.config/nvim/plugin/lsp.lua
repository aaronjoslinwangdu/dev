-- TODO: migrate to built-in LSP features
vim.pack.add({
	"https://www.github.com/williamboman/mason.nvim",
	"https://www.github.com/williamboman/mason-lspconfig.nvim",
	"https://www.github.com/neovim/nvim-lspconfig",
})

local utils = require("utils")

-- TODO: just use the lsp name as the key
local SERVERS = {
	ASTRO = { name = "astro" },
	C = { name = "clangd" },
	CSS = { name = "cssls" },
	ELIXIR = {
		name = "elixirls",
		extras = {
			flags = {
				debounce_text_changes = 150,
			},
			elixirLS = {
				dialyzerEnabled = false,
				fetchDeps = false,
			},
		},
	},
	ESLINT = { name = "eslint" },
	GO = { name = "gopls" },
	HTML = { name = "html" },
	LUA = {
		name = "lua_ls",
		extras = {
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
	},
	PYTHON = {
		name = "basedpyright",
		extras = {
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
	},
	TYPESCRIPT = { name = "ts_ls" },
	VIM = { name = "vimls" },
	RUST = {
		name = "rust_analyzer",
		extras = {
			rust_analyzer = {
				cargo = {
					features = "all",
				},
			},
		},
	},
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		SERVERS.VIM.name,
		SERVERS.LUA.name,
	},
})

local defaults = {
	-- TODO: this is not great, look into it
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	handlers = {
		["textDocument/hover"] = vim.lsp.buf.hover({ border = "rounded" }),
		["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({ border = "rounded" }),
	},
}

for _, server in pairs(SERVERS) do
	local opts = utils.merge(defaults, server.extras or {})
	vim.lsp.config(server.name, opts)
end

vim.lsp.enable(utils.map(SERVERS, function(server)
	return server.name
end))

vim.o.winborder = "single"
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end)
