return {
	{
		"zbirenbaum/copilot.lua",
		cmd = { "Copilot", "Copilot enable", "Copilot disable", "Copilot status" },
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<C-y>",
						accept_line = "<C-f>",
						next = "<C-n>",
						prev = "<C-p>",
						dismiss = "<C-c>",
					},
				},
				panel = {
					enabled = true,
					auto_refresh = true,
				},
				filetypes = {
					["*"] = true,
				},
				copilot_node_command = "node",
			})

			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "<leader>te", ":Copilot enable<CR>", { noremap = true, silent = false })
			keymap.set("n", "<leader>td", ":Copilot disable<CR>", { noremap = true, silent = false })
			keymap.set("n", "<leader>ts", ":Copilot status<CR>", { noremap = true, silent = false })
		end,
	},
}
