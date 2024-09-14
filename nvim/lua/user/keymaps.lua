-- ~/.config/nvim/lua/user/keymaps.lua

vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "InsertLeave" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" then
      if vim.lsp.buf.formatting_sync then
        vim.lsp.buf.formatting_sync()
      elseif vim.lsp.buf.format then
        vim.lsp.buf.format()
      end

      vim.cmd("write")
    end
  end,
  desc = "Auto-format and save on focus change or buffer leave",
})

-- map control + s to save
vim.api.nvim_set_keymap("i", "<C-s>", ":w<CR>", { noremap = true, silent = true })
