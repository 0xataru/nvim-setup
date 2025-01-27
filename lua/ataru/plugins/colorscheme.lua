return {
	{
		"projekt0n/github-nvim-theme",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme github_dark_default")

			vim.cmd([[
        highlight Normal guibg=NONE ctermbg=NONE
        highlight NonText guibg=NONE ctermbg=NONE

        highlight NeoTreeNormal guibg=NONE ctermbg=NONE
        highlight NeoTreeFloatNormal guibg=NONE ctermbg=NONE
        highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
        highlight NeoTreeCursorLine guibg=NONE ctermbg=NONE

        highlight VertSplit guibg=NONE ctermbg=NONE
        highlight SignColumn guibg=NONE ctermbg=NONE
        highlight EndOfBuffer guibg=NONE ctermbg=NONE
        highlight LineNr guibg=NONE ctermbg=NONE
        highlight CursorLineNr guibg=NONE ctermbg=NONE
        highlight Pmenu guibg=NONE ctermbg=NONE
        highlight PmenuSel guibg=NONE ctermbg=NONE
        highlight FloatBorder guibg=NONE ctermbg=NONE
        highlight NormalFloat guibg=NONE ctermbg=NONE
        highlight StatusLine guibg=NONE ctermbg=NONE
        highlight StatusLineNC guibg=NONE ctermbg=NONE
        highlight TabLine guibg=NONE ctermbg=NONE
        highlight TabLineFill guibg=NONE ctermbg=NONE
        highlight TabLineSel guibg=NONE ctermbg=NONE
        highlight WinSeparator guibg=NONE ctermbg=NONE
      ]])
		end,
	},
}
