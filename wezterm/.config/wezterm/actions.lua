local utils = require("utils")
local wezterm = require("wezterm")
local herdr = require("herdr")

local M = {}

M.active_pane = function(window, pane, pane_direction, vim_direction)
	if utils.is_vim(pane) then
		-- look vim navigator plugin
		-- https://github.com/francescarpi/dotfiles/blob/master/nvim/.config/nvim/lua/plugins/navigator.lua
		window:perform_action(wezterm.action.SendKey({ mods = "CTRL|SHIFT", key = vim_direction }), pane)
	elseif utils.is_herdr(pane) then
		herdr.activate_pane(string.lower(pane_direction))
	else
		window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
	end
end

M.resize_pane = function(window, pane, direction)
	if utils.is_herdr(pane) then
		herdr.resize_pane(string.lower(direction))
	else
		window:perform_action(wezterm.action.AdjustPaneSize({ direction, 5 }), pane)
	end
end

M.toggle_zoom = function(window, pane)
	if utils.is_herdr(pane) then
		herdr.toggle_zoom_pane()
	else
		window:perform_action(wezterm.action.TogglePaneZoomState, pane)
	end
end

M.split_pane = function(window, pane, type)
	if utils.is_herdr(pane) then
		herdr.split_pane(type)
	else
		if type == "right" then
			window:perform_action(wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
		elseif type == "down" then
			window:perform_action(wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
		end
	end
end

M.activate_tab = function(window, pane, direction)
	if utils.is_herdr(pane) then
		herdr.activate_tab(direction)
	else
		if direction == "previous" then
			window:perform_action(wezterm.action.ActivateTabRelative(-1), pane)
		elseif direction == "next" then
			window:perform_action(wezterm.action.ActivateTabRelative(1), pane)
		end
	end
end

M.activate_workspace_by_index = function(pane, index)
	if utils.is_herdr(pane) then
		herdr.activate_workspace_by_index(index)
	end
end

M.activate_tab_by_index = function(window, pane, index)
	if utils.is_herdr(pane) then
		local tab = herdr.get_tab_by_index(index)
		if tab then
			herdr.activate_tab_by_id(tab.tab_id)
		end
	else
		local active_tab_index = nil
		local next_tab_index = index - 1

		local active_tab = window:active_tab()
		for index, tab in ipairs(window:mux_window():tabs()) do
			if tab:tab_id() == active_tab:tab_id() then
				active_tab_index = index - 1
				break
			end
		end

		if active_tab_index == next_tab_index then
			window:perform_action(wezterm.action.ActivateLastTab, pane)
		else
			window:perform_action(wezterm.action.ActivateTab(next_tab_index), pane)
		end
	end
end

M.new_tab = function(window, pane)
	if utils.is_herdr(pane) then
		herdr.new_tab()
	else
		-- https://github.com/wez/wezterm/issues/909
		local mux_win = window:mux_window()
		for _, item in ipairs(mux_win:tabs_with_info()) do
			if item.is_active then
				mux_win:spawn_tab({})
				window:perform_action(wezterm.action.MoveTab(item.index + 1), pane)
				return
			end
		end
	end
end

M.activate_workspace = function(pane, direction)
	if utils.is_herdr(pane) then
		herdr.activate_workspace(direction)
	end
end

M.rotate_panes = function(pane)
	if utils.is_herdr(pane) then
		wezterm.log_warn("rotate_panes: Not implemented on herdr")
	else
		wezterm.action.RotatePanes("CounterClockwise")
	end
end

return M
