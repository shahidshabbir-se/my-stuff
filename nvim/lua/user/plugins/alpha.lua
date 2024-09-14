return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("n", "  New File", "<cmd>ene<CR>"),
			dashboard.button("f", "  Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("o", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("g", "  Find Text", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("c", "  Config", "<cmd>edit ~/.config/nvim/init.lua<CR>"),
			dashboard.button("s", "  Restore Session", "<cmd>lua require('persistence').load()<CR>"),
			dashboard.button("t", "  Restore Sessions", "<cmd>Telescope session-lens<CR>"),
			dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
			dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		dashboard.section.footer.val = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
		end

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		vim.api.nvim_set_hl(0, "AlphaButton", { bg = "none", fg = "#ffffff", bold = true })
		vim.api.nvim_set_hl(0, "AlphaButtonShortcut", { bg = "none", fg = "#ff0000", bold = true })
	end,
}
