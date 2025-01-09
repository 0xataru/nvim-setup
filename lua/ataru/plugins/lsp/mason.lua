return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls", -- Lua LSP
				"pyright", -- Python LSP
				"rust_analyzer", -- Rust LSP
				"gopls", -- Go LSP
				"intelephense", -- PHP LSP
				"ts_ls", -- TypeScript/JavaScript LSP
				"tailwindcss", -- TailwindCSS LSP
				"html", -- HTML LSP
				"cssls", -- CSS LSP
				"emmet_ls", -- Emmet LSP
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Formatters
				"stylua", -- Lua formatter
				"isort", -- Python formatter
				"black", -- Python formatter
				"phpcbf", -- PHP formatter
				"prettier", -- Formatter for JS/TS/HTML/CSS/Markdown
				-- Linters
				"pylint", -- Python linter
				"phpcs", -- PHP linter
				"eslint_d", -- JS/TS linter
				"stylelint", -- CSS linter
				"jsonlint", -- JSON linter
				"yamllint", -- YAML linter
				"markdownlint", -- Markdown linter
			},
		})
	end,
}
