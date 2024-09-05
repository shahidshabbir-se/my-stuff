-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "chadracula-evondev",
  transparency=true,
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui={
  nvdash = {
    load_on_startup = true,
    header = {
      [[                               __                ]],
	    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    },
    buttons = {
      { "  Find File", ", f f", "Telescope find_files" },
      { "  Recent Files", ", f o", "Telescope oldfiles" },
      { "  Find Word", ", f w", "Telescope live_grep" },
      { "  Bookmarks", ", b m", "Telescope marks" },
      { "  Themes", ", t h", "Telescope themes" },
      { "  Mappings", ", c h", "NvCheatsheet" },
      { "  Quit", ", q  ", "quit" },
    },
  },
}

return M
