-- Path to Lazy.nvim installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load Lazy.nvim
local lazy = require('lazy')

-- Load plugins
local plugins = require('user.plugins.loader').load_plugins()

-- Setup Lazy.nvim with the loaded plugins
lazy.setup(plugins)

