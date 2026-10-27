local utils = require("utils")
local wezterm = require("wezterm")
local backend = require("backend")
local tuios = require("tuios")

local M = {}

local function activate_tab_action(window, index)
	local next_tab_index = index - 1
	local active_tab = window:active_tab()

	for idx, tab in ipairs(window:mux_window():tabs()) do
		if tab:tab_id() == active_tab:tab_id() then
			if (idx - 1) == next_tab_index then
				return wezterm.action.ActivateLastTab
			end
			break
		end
	end

	return wezterm.action.ActivateTab(next_tab_index)
end

M.dispatch = {
	active_pane = {
		vim = function(_, _, direction, vim_direction)
			return wezterm.action.SendKey({ mods = "CTRL|SHIFT", key = vim_direction })
		end,
		herdr = function(_, _, direction)
			backend.pane_focus("herdr", string.lower(direction))
		end,
		tuios = function(_, _, direction)
			backend.pane_focus("tuios", string.lower(direction))
		end,
		wezterm = function(_, _, direction)
			return wezterm.action.ActivatePaneDirection(direction)
		end,
	},

	resize_pane = {
		herdr = function(_, _, direction)
			backend.pane_resize("herdr", string.lower(direction))
		end,
		tuios = function(_, _, direction)
			backend.pane_resize("tuios", string.lower(direction))
		end,
		wezterm = function(_, _, direction)
			return wezterm.action.AdjustPaneSize({ direction, 5 })
		end,
	},

	toggle_zoom = {
		herdr = function()
			backend.pane_zoom("herdr")
		end,
		tuios = function()
			backend.pane_zoom("tuios")
		end,
		wezterm = function()
			return wezterm.action.TogglePaneZoomState
		end,
	},

	split_pane = {
		herdr = function(_, _, type)
			backend.pane_split("herdr", type)
		end,
		tuios = function(_, _, type)
			tuios.split_window(type == "right" and "vertical" or "horizontal")
		end,
		wezterm = function(_, _, type)
			if type == "right" then
				return wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })
			end
			return wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" })
		end,
	},

	rotate_panes = {
		herdr = function()
			backend.pane_swap("herdr", "left")
		end,
		tuios = function()
			tuios.rotate_layout()
		end,
		wezterm = function()
			return wezterm.action.RotatePanes("CounterClockwise")
		end,
	},

	activate_tab = {
		herdr = function(_, _, direction)
			backend.activate_tab("herdr", direction)
		end,
		tuios = function(_, _, direction)
			tuios.switch_session_relative(direction)
		end,
		wezterm = function(_, _, direction)
			if direction == "previous" then
				return wezterm.action.ActivateTabRelative(-1)
			end
			return wezterm.action.ActivateTabRelative(1)
		end,
	},

	activate_workspace = {
		herdr = function(_, _, direction)
			backend.activate_workspace("herdr", direction)
		end,
		tuios = function(_, _, direction)
			tuios.activate_workspace(direction)
		end,
	},

	activate_workspace_by_index = {
		herdr = function(_, _, index)
			backend.activate_workspace_by_index("herdr", index)
		end,
		tuios = function(_, _, index)
			tuios.select_workspace(index)
		end,
	},

	activate_tab_by_index = {
		herdr = function(_, _, index)
			local tab = backend.get_tab_by_index("herdr", index)
			if tab then
				backend.focus_tab_by_id("herdr", tab.tab_id)
			end
		end,
		wezterm = function(window, _, index)
			local next_tab_index = index - 1
			local active_tab = window:active_tab()

			for idx, tab in ipairs(window:mux_window():tabs()) do
				if tab:tab_id() == active_tab:tab_id() then
					if (idx - 1) == next_tab_index then
						return wezterm.action.ActivateLastTab
					end
					break
				end
			end

			return wezterm.action.ActivateTab(next_tab_index)
		end,
	},

	new_tab = {
		herdr = function()
			backend.create_tab("herdr")
		end,
		wezterm = function(window)
			local mux_win = window:mux_window()
			for _, item in ipairs(mux_win:tabs_with_info()) do
				if item.is_active then
					mux_win:spawn_tab({})
					window:perform_action(wezterm.action.MoveTab(item.index + 1))
					return
				end
			end
		end,
	},

	goto_workspace_or_tab = {
		herdr = function(_, _, index)
			backend.activate_workspace_by_index("herdr", index)
		end,
		tuios = function(_, _, index)
			tuios.select_workspace(index)
		end,
		wezterm = function(window, _, index)
			return activate_tab_action(window, index)
		end,
	},

	goto_tab_or_workspace = {
		herdr = function(_, _, index)
			local tab = backend.get_tab_by_index("herdr", index)
			if tab then
				backend.focus_tab_by_id("herdr", tab.tab_id)
			end
		end,
		tuios = function(_, _, index)
			tuios.select_workspace(index)
		end,
		wezterm = function(window, _, index)
			return activate_tab_action(window, index)
		end,
	},
}

M.resolve = function(name, window, pane, ...)
	local target = M.dispatch[name]
	if not target then
		return
	end

	local backend_name = utils.backend_of(pane)
	local handler = target[backend_name]
	if not handler then
		return
	end

	local action = handler(window, pane, ...)
	if action then
		window:perform_action(action, pane)
	end
end

M.active_pane = function(window, pane, direction, vim_direction)
	M.resolve("active_pane", window, pane, direction, vim_direction)
end

M.resize_pane = function(window, pane, direction)
	M.resolve("resize_pane", window, pane, direction)
end

M.toggle_zoom = function(window, pane)
	M.resolve("toggle_zoom", window, pane)
end

M.split_pane = function(window, pane, type)
	M.resolve("split_pane", window, pane, type)
end

M.rotate_panes = function(window, pane)
	M.resolve("rotate_panes", window, pane)
end

M.activate_tab = function(window, pane, direction)
	M.resolve("activate_tab", window, pane, direction)
end

M.activate_workspace = function(window, pane, direction)
	M.resolve("activate_workspace", window, pane, direction)
end

M.activate_workspace_by_index = function(window, pane, index)
	M.resolve("activate_workspace_by_index", window, pane, index)
end

M.activate_tab_by_index = function(window, pane, index)
	M.resolve("activate_tab_by_index", window, pane, index)
end

M.goto_workspace_or_tab = function(window, pane, index)
	M.resolve("goto_workspace_or_tab", window, pane, index)
end

M.goto_tab_or_workspace = function(window, pane, index)
	M.resolve("goto_tab_or_workspace", window, pane, index)
end

M.new_tab = function(window, pane)
	M.resolve("new_tab", window, pane)
end

return M
