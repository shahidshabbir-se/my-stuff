return {
	-- Other plugins...

	{
		"echasnovski/mini.nvim",
		version = "*", -- Use the latest version of mini.nvim
		config = function()
			require("mini.jump2d").setup({
				-- Default configuration, customize as needed
				spotter = nil,
				labels = "abcdefghijklmnopqrstuvwxyz",
				view = {
					dim = false,
					n_steps_ahead = 0,
				},
				allowed_lines = {
					blank = true,
					cursor_before = true,
					cursor_at = true,
					cursor_after = true,
					fold = true,
				},
				allowed_windows = {
					current = true,
					not_current = true,
				},
				hooks = {
					before_start = nil,
					after_jump = nil,
				},
				mappings = {
					start_jumping = "<C - j>",
				},
				silent = false,
			})
		end,
	},
}
