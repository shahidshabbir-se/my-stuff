local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
}

-- Set the border color using the FloatBorder highlight group

M.config = function()
  require("toggleterm").setup({
    size = 20,
    open_mapping = [[<A-t>]],
    direction = "horizontal",
    shell = "/bin/zsh",
    float_opts = {
      border = "rounded",
    },
  })

  vim.api.nvim_set_keymap(
    "n",
    "<A-1>",
    ":ToggleTerm size=10 direction=horizontal<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap("n", "<A-2>", ":ToggleTerm size=20 direction=vertical<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<A-3>", ":ToggleTerm size=30 direction=float<CR>", { noremap = true, silent = true })

  vim.api.nvim_set_keymap(
    "t",
    "<A-1>",
    "<C-\\><C-n>:ToggleTerm size=10 direction=horizontal<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "t",
    "<A-2>",
    "<C-\\><C-n>:ToggleTerm size=20 direction=vertical<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "t",
    "<A-3>",
    "<C-\\><C-n>:ToggleTerm size=30 direction=float<CR>",
    { noremap = true, silent = true }
  )
end

return M
