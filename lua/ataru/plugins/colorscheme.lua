return {
  {
    "projekt0n/github-nvim-theme",
    priority = 1000, -- make sure to load this before all the other start plugins
    -- load the colorscheme here
    config = function()
      vim.cmd([[
        colorscheme github_dark_default
        highlight Normal guibg=NONE
        highlight NonText guibg=NONE
      ]])
    end,
  },
}
