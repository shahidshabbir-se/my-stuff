return {
	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
			crates.show()
			require("core.utils").load_mappings("crates")
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			require("custom.configs.rustaceanvim")
		end,
	},
	-- For lazy.nvim or packer.nvim setup
	{
		"simrat39/rust-tools.nvim",
		requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" },
		config = function()
			require("rust-tools").setup({})
		end,
	},
}
