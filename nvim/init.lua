-- Set leader key (optional)
vim.g.mapleader = " "

-- Load general settings
require("user.settings")

-- Load key mappings
require("user.keymaps")

-- Load auto commands
require("user.autocmds")

-- Initialize Lazy.nvim and load plugins
require("user.plugins")
