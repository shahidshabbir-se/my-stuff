return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        disabled_filetypes = { "mason", "dashboard", "lazy", "ministarter" },
      },
    })
  end,
}
