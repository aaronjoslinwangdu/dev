return {
	{
		"williamboman/mason.nvim",
		-- pin mason version for now because of breaking changes in 2.0
		version = "1.11.0",
		opts = {
			ensure_installed = {
				"vimls",
				"lua_ls",
				"basedpyright",
				"ts_ls",
				"html",
				"cssls",
			},
			automatic_installation = true,
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		-- pin mason version for now because of breaking changes in 2.0
		version = "1.32.0",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"vimls",
					"lua_ls",
					"ts_ls",
					"basedpyright",
					"html",
					"eslint",
					"astro",
					"cssls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				handlers = handlers,
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
							},
						},
					},
				},
			})

			lspconfig.basedpyright.setup({
				capabilities = capabilities,
				handlers = handlers,
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
			})

			lspconfig.html.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.astro.setup({
				on_attach = function()
					vim.cmd("let g:astro_typescript = 'enable'")
				end,
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.vimls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		end,
	},
}
