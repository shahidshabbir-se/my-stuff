return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local button = dashboard.button
		local icons = require("user.icons")
		-- Set header
		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
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
			button("f", icons.ui.Files .. "  Find file", ":Telescope find_files <CR>"),
			button("n", icons.ui.NewFile .. "  New file", ":ene <BAR> startinsert <CR>"),
			-- button("s", icons.ui.SignIn .. " Load session", ":lua require('persistence').load()<CR>"),
			button(
				"p",
				icons.git.Repo .. "  Find project",
				":lua require('telescope').extensions.projects.projects()<CR>"
			),
			button("r", icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>"),
			button("t", icons.ui.Text .. "  Find text", ":Telescope live_grep <CR>"),
			button("c", icons.ui.Gear .. "  Config", ":e ~/.config/nvim/init.lua <CR>"),
			button("q", icons.ui.SignOut .. "  Quit", ":qa<CR>"),
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
