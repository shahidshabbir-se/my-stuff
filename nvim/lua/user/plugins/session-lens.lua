-- ~/.config/nvim/lua/user/plugins/session-lens.lua

return {
	"rmagatti/session-lens",
	requires = { "nvim-telescope/telescope.nvim" },
	config = function()
		local session_lens = require("session-lens")

		session_lens.setup({
			path = "~/.config/nvim/session", -- Directory for storing session files
			-- You can customize the Telescope integration here
			telescope = {
				theme = "dropdown",
				previewer = false,
			},
		})

		-- Optional: Keybinding to open session lens with Telescope
		vim.api.nvim_set_keymap("n", "<leader>sl", "<cmd>Telescope session-lens<CR>", { noremap = true, silent = true })
	end,
}
