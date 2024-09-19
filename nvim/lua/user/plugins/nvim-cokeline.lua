-- ~/.config/nvim/lua/user/plugins/cokeline.lua
return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
		"stevearc/resession.nvim", -- Optional, for persistent history
	},
	config = function()
		require("cokeline").setup({
			sidebar = {
				filetype = { "NvimTree", "neo-tree" },
				components = {
					{
						text = function(buf)
							return buf.filetype
						end,
						fg = "#FFFF00", -- Example color
						bold = true,
					},
				},
			},
		})
	end,
}
