local M = {}

function M.load_plugins()
  local plugins = {}

  -- Iterate over all files in the plugins directory
  local plugin_files = vim.fn.globpath(vim.fn.stdpath('config') .. '/lua/user/plugins', '*.lua', false, true)
  for _, file in ipairs(plugin_files) do
    local file_name = vim.fn.fnamemodify(file, ':t:r') -- Get file name without extension
    if file_name ~= 'init' and file_name ~= 'loader' then
      local plugin_spec = require('user.plugins.' .. file_name)
      if type(plugin_spec) == 'table' then
        table.insert(plugins, plugin_spec)
      end
    end
  end

  return plugins
end

return M

