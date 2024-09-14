return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local mason = require("mason")
    local mason_dap = require("mason-nvim-dap")

    -- Setup DAP UI
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    -- Close DAP UI automatically when session ends
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Setup Mason for managing external tools
    mason.setup()
    mason_dap.setup({
      ensure_installed = { "js-debug-adapter" },
      automatic_installation = true,
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue Debugging" })
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
  end,
}
