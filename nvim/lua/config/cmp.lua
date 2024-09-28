local cmp = require('cmp')

cmp.setup({
  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:MyHighlight",
      winblend = 0,
      scrollbar = false,
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:MyHighlight",
      winblend = 0,
    },
  },
})
