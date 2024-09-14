return {
	"matze/vim-move",
	config = function()
		-- Plugin configuration
		vim.g.move_key_modifier = "M" -- Optional: Set key modifier for move commands
		-- Example mappings (can be customized as needed)
		vim.api.nvim_set_keymap("n", "<A-j>", ":move .+1<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<A-k>", ":move .-2<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
	end,
}
