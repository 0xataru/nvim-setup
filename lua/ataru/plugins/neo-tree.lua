return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"s1n7ax/nvim-window-picker",
	},
	config = function()
		-- vim.g.loaded_netrw = 1
		-- vim.g.loaded_netrwPlugin = 1

		require("neo-tree").setup({
			window = {
				width = 35,
				mappings = {
					["<space>"] = "toggle_node",
					["<cr>"] = "open",
					["h"] = "close_node",
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						".DS_Store",
					},
				},
			},
			buffers = {
				show_unloaded = true,
			},
			window_picker = {
				enable = true,
				use_winbar = false,
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
			open_files_do_not_replace_types = { "terminal", "trouble", "qf", "help" },
			default_component_configs = {
				indent = {
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
				},
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>e", "<cmd>Neotree float toggle<CR>", { desc = "Toggle floating file explorer" })
	end,
}
