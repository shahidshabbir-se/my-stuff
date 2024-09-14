-- lua/user/plugins/none-ls.lua
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		-- Setup `none-ls` with your sources
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.shellharden,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,
			},
		})

		-- Keymap for manual formatting
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

		-- Setup LSP formatting on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			pattern = "*",
			callback = function()
				if vim.lsp.buf_get_clients(0)[1] then
					vim.lsp.buf.format({ async = false }) -- Use sync formatting for blocking behavior
				end
			end,
		})
	end,
}
