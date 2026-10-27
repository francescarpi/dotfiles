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

M.activate_workspace = function(direction)
	local current = M.get_current_workspace()

	local next
	if direction == "next" then
		next = (current % 9) + 1
	else
		next = ((current - 2) % 9) + 1
	end

	M.select_workspace(next)
end

M.get_current_workspace = function()
	local _, stdout = wezterm.run_child_process({ tuios_bin, "list-workspaces", "--json" })
	if not stdout or stdout == "" then
		return nil
	end

	local ok, data = pcall(wezterm.json_parse, stdout)
	if not ok or not data then
		return nil
	end

	return data.current_workspace
end

return M
