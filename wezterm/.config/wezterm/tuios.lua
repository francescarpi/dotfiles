local wezterm = require("wezterm")

local M = {}
local tuios_bin = "/opt/homebrew/bin/tuios"
local previous_workspace = nil

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
		"pane",
		"focus",
		"--direction",
		direction,
		"--current",
	})
end

M.resize_pane = function(direction)
	wezterm.background_child_process({
		tuios_bin,
		"pane",
		"resize",
		"--direction",
		direction,
		"--amount",
		".05",
		"--current",
	})
end

M.toggle_zoom_pane = function()
	wezterm.background_child_process({
		tuios_bin,
		"pane",
		"zoom",
		"--current",
		"--toggle",
	})
end

M.select_workspace = function(num, opts)
	local allow_toggle = opts == nil or opts.allow_toggle ~= false
	local current = M.get_current_workspace()
	local target = num

	if allow_toggle and current == num and previous_workspace ~= nil and previous_workspace ~= num then
		target = previous_workspace
	end

	previous_workspace = current

	wezterm.background_child_process({
		tuios_bin,
		"select-workspace",
		tostring(target),
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

	M.select_workspace(next, { allow_toggle = false })
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
