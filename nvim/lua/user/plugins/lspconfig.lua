-- ~/.config/nvim/lua/user/plugins/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- LSP servers setup
    lspconfig.ts_ls.setup({})
    lspconfig.html.setup({})
    lspconfig.cssls.setup({})
    lspconfig.tailwindcss.setup({})
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    lspconfig.graphql.setup({})
    lspconfig.emmet_ls.setup({})
    lspconfig.prismals.setup({})

    -- Rust LSP setup
    lspconfig.rust_analyzer.setup({
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            command = "clippy", -- You can use 'clippy' for more linting options
          },
        },
      },
    })

    -- -- Adddditional Rust tools
    -- require("rust-tools").setup({
    --   server = {
    --     on_attach = function(_, bufnr)
    --       -- Example keybindings for Rust tools
    --       local opts = { noremap = true, silent = true }
    --       vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>RustHoverActions<CR>", opts)
    --       vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ca", "<cmd>RustCodeAction<CR>", opts)
    --       vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>dr", "<cmd>RustDebuggables<CR>", opts)
    --     end,
    --   },
    -- })
  end,
}
