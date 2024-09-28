return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        disabled_filetypes = { "mason", "dashboard", "lazy", "ministarter" },
      },
    })
  end,
}
