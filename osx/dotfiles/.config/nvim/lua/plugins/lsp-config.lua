local utils = require("utils")

local LSP = {
	VIM = "vimls",
	LUA = "lua_ls",
	TYPESCRIPT = "ts_ls",
	PYTHON = "basedpyright",
	HTML = "html",
	ESLINT = "eslint",
	ASTRO = "astro",
	CSS = "cssls",
	GO = "gopls",
	ELIXIR = "elixirls",
	RUST = "rust_analyzer",
}

local SERVERS = utils.values(LSP)

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = SERVERS,
			automatic_installation = true,
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = SERVERS,
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- improved tooltip visuals for 'K'
			vim.o.winborder = "single"
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({ border = "rounded" })
			end)

			-- lets language server know what capabilities the client supports
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- handle how responses from language servers are displayed
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}

			-- language server agnostic configs
			local defaults = {
				capabilities = capabilities,
				handlers = handlers,
			}

			-- language server specific configs, for more info look into the respective repos
			local extras = {
				[LSP.LUA] = {
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
				[LSP.PYTHON] = {
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
				[LSP.ASTRO] = {
					on_attach = function()
						vim.cmd("let g:astro_typescript = 'enable'")
					end,
				},
				[LSP.ELIXIR] = {
					cmd = { "/opt/homebrew/Cellar/elixir-ls/0.29.3/libexec/language_server.sh" }, -- this kinda sucks
					flags = {
						debounce_text_changes = 150,
					},
					elixirLS = {
						dialyzerEnabled = false,
						fetchDeps = false,
					},
				},
				[LSP.RUST] = {
					settings = {
						[LSP.RUST] = {
							cargo = {
								features = "all",
							},
						},
					},
				},
			}

			-- set up each language server
			for _, server in ipairs(SERVERS) do
				vim.lsp.config(server, utils.merge(defaults, extras[server]))
			end

			-- enable language servers
			vim.lsp.enable(SERVERS)
		end,
	},
}
