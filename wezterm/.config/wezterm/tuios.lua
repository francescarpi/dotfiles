local wezterm = require("wezterm")

local M = {}
local tuios_bin = "/opt/homebrew/bin/tuios"

M.split_horizontal = function()
  wezterm.background_child_process({
    tuios_bin,
    "split-window",
    "horizontal",
  })
end

M.split_vertical = function()
  wezterm.background_child_process({
    tuios_bin,
    "split-window",
    "vertical",
  })
end

M.activate_window = function(direction)
  wezterm.background_child_process({
    tuios_bin,
    "focus-window",
    "--direction",
    direction,
  })
end

M.select_workspace = function(num)
  wezterm.background_child_process({
    tuios_bin,
    "select-workspace",
    num,
  })
end

return M
