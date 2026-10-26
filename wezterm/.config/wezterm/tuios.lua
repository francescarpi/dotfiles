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

return M
