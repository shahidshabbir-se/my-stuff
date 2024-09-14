-- ~/.config/nvim/lua/user/plugins/treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require('user.plugins.treesitter')
  end
}
