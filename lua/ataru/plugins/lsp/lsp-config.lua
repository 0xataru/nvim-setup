return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")
		local keymap = vim.keymap -- for conciseness

		-- Auto command for LSP settings
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Keybindings for LSP functions
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Rust Analyzer setup
		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					diagnostics = {
						enable = true,
						experimental = {
							enable = true,
						},
					},
					checkOnSave = {
						command = "clippy",
					},
					cargo = {
						features = "all",
					},
				},
			},
		})

		-- Go setup
		lspconfig.gopls.setup({
			capabilities = capabilities,
		})

		-- Python setup
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		-- PHP setup
		lspconfig.intelephense.setup({
			capabilities = capabilities,
			settings = {
				intelephense = {
					stubs = {
						"apache",
						"bcmath",
						"bz2",
						"calendar",
						"com_dotnet",
						"Core",
						"ctype",
						"curl",
						"date",
						"dba",
						"dom",
						"enchant",
						"exif",
						"FFI",
						"fileinfo",
						"filter",
						"fpm",
						"ftp",
						"gd",
						"gettext",
						"gmp",
						"hash",
						"iconv",
						"imap",
						"intl",
						"json",
						"ldap",
						"libxml",
						"mbstring",
						"mcrypt",
						"mysqli",
						"oci8",
						"odbc",
						"openssl",
						"pcntl",
						"pcre",
						"PDO",
						"pdo_mysql",
						"pdo_sqlite",
						"pgsql",
						"Phar",
						"posix",
						"pspell",
						"readline",
						"Reflection",
						"session",
						"shmop",
						"SimpleXML",
						"snmp",
						"soap",
						"sockets",
						"sodium",
						"SPL",
						"sqlite3",
						"standard",
						"superglobals",
						"sysvsem",
						"sysvshm",
						"tokenizer",
						"xml",
						"xmlreader",
						"xmlwriter",
						"yaml",
						"Zend OPcache",
						"zip",
						"zlib",
					},
					files = {
						maxSize = 5000000,
					},
				},
			},
		})

		-- TypeScript/JavaScript setup
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			settings = {
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
					},
				},
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
					},
				},
			},
		})

		-- React and TailwindCSS support
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		-- HTML/Emmet setup
		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			filetypes = { "html", "css", "typescriptreact", "javascriptreact", "svelte" },
		})
	end,
}
