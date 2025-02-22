return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua", -- lua formatter
					"prettierd", -- js/ts formatter
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"html",
					"cssls",
					"eslint",
					"jsonls",
					"ts_ls",
					"elixirls",
					"bashls",
					"terraformls",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Add borders to hover and help
			vim.lsp.handlers["textDocument/hover"] =
				vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", max_width = 80, max_height = 40 })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded", max_width = 80, max_height = 40 })

			-- Set keymaps on LspAttach
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local opts = { buffer = event.buf }

					-- Jump to the definition of the word under your cursor.
					opts.desc = "go to definition"
					vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)

					-- Find references for the word under your cursor.
					opts.desc = "go to references"
					vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)

					-- Jump to the implementation of the word under your cursor.
					opts.desc = "go to implementation"
					vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, opts)

					-- Rename the variable under your cursor.
					opts.desc = "rename variable"
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					-- Execute a code action
					opts.desc = "execute a code action"
					vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					-- Goto Declaration.
					opts.desc = "go to declaration"
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

					-- Show line diagnostics in a floating window
					opts.desc = "show line diagnostic in floating window"
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

					-- Move to the previous diagnostic
					opts.desc = "move to previous diagnostic"
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

					-- Move to the next diagnostic
					opts.desc = "move to next diagnostic"
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						vim.keymap.set("n", "<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, { buffer = event.buf, desc = "toggle inlay hints" })
					end
				end,
			})

			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- setup servers
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = {
						autoImportCompletion = true,
					},
				},
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.bashls.setup({
				capabilities = capabilities,
			})

			lspconfig.elixirls.setup({
				capabilities = capabilities,
				cmd = { "elixir-ls" },
			})
		end,
	},
}
