-- ~/.config/nvim/lua/user/plugins/cmp.lua

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
  },
  config = function()
    require('user.plugins.cmp')
  end
}
