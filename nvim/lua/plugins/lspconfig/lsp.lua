-- lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "pmizio/typescript-tools.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
  },
  config = function()
    require("lspconfig").ts_ls.setup({
      on_attach = function(client, buffer)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end,
    })

    require("lspconfig").prismals.setup({
      on_attach = function(client, buffer)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end,
      settings = {
        prisma = {
          prismaFmtBinPath = "", -- Leave this empty to use default Prisma formatter
        },
      },
    })

    -- require("lspconfig").eslint.setup({
    --   on_attach = function(client, buffer)
    --     require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
    --   end,
    --   settings = {
    --     workingDirectories = { mode = "auto" },
    --   },
    -- })

    require("mason-lspconfig").setup_handlers({
      ["ts_ls"] = function()
        require("typescript-tools").setup({})
      end,
    })
  end,
}
