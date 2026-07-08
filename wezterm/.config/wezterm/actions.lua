local utils = require("utils")
local wezterm = require("wezterm")
local herdr_bin = "/opt/homebrew/bin/herdr"

local M = {}

M.active_pane = function(window, pane, pane_direction, vim_direction)
	if utils.is_vim(pane) then
		-- look vim navigator plugin
		-- https://github.com/francescarpi/dotfiles/blob/master/nvim/.config/nvim/lua/plugins/navigator.lua
		window:perform_action(wezterm.action.SendKey({ mods = "CTRL|SHIFT", key = vim_direction }), pane)
	elseif utils.is_herdr(pane) then
		wezterm.background_child_process({
			herdr_bin,
			"pane",
			"focus",
			"--direction",
			string.lower(pane_direction),
			"--current",
		})
	else
		window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
	end
end

M.resize_pane = function(window, pane, direction)
	if utils.is_herdr(pane) then
		wezterm.background_child_process({
			herdr_bin,
			"pane",
			"resize",
			"--direction",
			string.lower(direction),
			"--amount",
			".01",
			"--current",
		})
	else
		window:perform_action(wezterm.action.AdjustPaneSize({ direction, 5 }), pane)
	end
end

M.toggle_zoom = function(window, pane)
	if utils.is_herdr(pane) then
		wezterm.background_child_process({
			herdr_bin,
			"pane",
			"zoom",
			"--toggle",
			"--current",
		})
	else
		window:perform_action(wezterm.action.TogglePaneZoomState, pane)
	end
end

M.split_pane = function(window, pane, type)
	if utils.is_herdr(pane) then
		wezterm.background_child_process({
			herdr_bin,
			"pane",
			"split",
			"--direction",
			type,
			"--current",
			"--focus",
		})
	else
		if type == "right" then
			window:perform_action(wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
		elseif type == "down" then
			window:perform_action(wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
		end
	end
end

M.activate_tab_or_session = function(window, pane, direction)
	if utils.is_herdr(pane) then
		local _, stdout = wezterm.run_child_process({ herdr_bin, "workspace", "list" })

		if not stdout or stdout == "" then
			return
		end

		local ok, data = pcall(wezterm.json_parse, stdout)
		if not ok or not data or not data.result or not data.result.workspaces then
			return
		end

		local workspaces = data.result.workspaces
		local total = #workspaces
		if total == 0 then
			return
		end

		local focused_index = nil
		for i, ws in ipairs(workspaces) do
			if ws.focused then
				focused_index = i
				break
			end
		end
		if not focused_index then
			return
		end

		local new_index
		if direction == "next" then
			new_index = (focused_index % total) + 1
		elseif direction == "previous" then
			new_index = ((focused_index - 2) % total) + 1
		else
			return
		end

		local target = workspaces[new_index]
		wezterm.background_child_process({
			herdr_bin,
			"workspace",
			"focus",
			target.workspace_id,
		})
	else
		if direction == "previous" then
			window:perform_action(wezterm.action.ActivateTabRelative(-1), pane)
		elseif direction == "next" then
			window:perform_action(wezterm.action.ActivateTabRelative(1), pane)
		end
	end
end

return M
