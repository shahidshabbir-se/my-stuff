return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp", -- Completion plugin
  },
  config = function()
    -- import nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- configure autopairs
    autopairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        html = { "template_string" }, -- add pairs in HTML template strings
        javascript = { "template_string" }, -- add pairs in JavaScript template strings
        typescript = { "template_string" }, -- add pairs in TypeScript template strings
        javascriptreact = { "template_string" }, -- add pairs in JavaScript React template strings
        typescriptreact = { "template_string" }, -- add pairs in TypeScript React template strings
        -- Add more configurations for other web-related file types as needed
      },
    })

    -- import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- import nvim-cmp plugin (completions plugin)
    local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
