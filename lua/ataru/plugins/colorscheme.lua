return {
	{
		"projekt0n/github-nvim-theme",
		-- "rose-pine/neovim",
		priority = 1000, -- make sure to load this before all the other start plugins
		-- load the colorscheme here
		config = function()
			vim.cmd([[
        colorscheme github_dark_default
        "colorscheme rose-pine
        highlight Normal guibg=NONE
        highlight NonText guibg=NONE
      ]])
		end,
	},
}
