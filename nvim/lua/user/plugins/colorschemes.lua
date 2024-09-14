return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({
				transparent = true,
			})
		end,
	},
	{
		"decaycs/decay.nvim",
		name = "decay",
		lazy = false,
		priority = 1000,
		config = function()
			require("decay").setup({
				transparent = true,
			})
		end,
	},
	{
		"pineapplegiant/spaceduck",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("let g:spaceduck_transparent = 1")
		end,
	},
	{
		"catppuccin/nvim",
		as = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				transparent_background = true,
			})
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		config = function()
			require("dracula").setup({
				transparent_bg = true, -- Set transparency for Dracula
			})
		end,
	},
}
