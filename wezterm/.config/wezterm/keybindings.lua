local wezterm = require("wezterm")
local is_maximized = false

local M = {}

local function is_vim(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local function active_pane(window, pane, pane_direction, vim_direction)
	if is_vim(pane) then
		-- look vim navigator plugin
		-- https://github.com/francescarpi/dotfiles/blob/master/nvim/.config/nvim/lua/plugins/navigator.lua
		window:perform_action(act.SendKey({ mods = "CTRL|SHIFT", key = vim_direction }), pane)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end

M.setup = function(config)
	config.send_composed_key_when_right_alt_is_pressed = true
	config.send_composed_key_when_left_alt_is_pressed = true
	config.keys = {
		{ mods = "CMD", key = "d", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ mods = "CMD|SHIFT", key = "d", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ mods = "CMD", key = "z", action = wezterm.action.TogglePaneZoomState },
		{ mods = "CMD", key = "p", action = wezterm.action.ActivateTabRelative(-1) },
		{ mods = "CMD", key = "n", action = wezterm.action.ActivateTabRelative(1) },
		{ mods = "CMD|SHIFT", key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
		{ mods = "CMD|SHIFT", key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
		{ mods = "CMD|SHIFT", key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
		{ mods = "CMD|SHIFT", key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
		{ mods = "CMD", key = "a", action = wezterm.action.ActivateLastTab },
		{ mods = "CMD", key = "o", action = wezterm.action.PaneSelect({ alphabet = "1234567890" }) },
		{
			mods = "CMD",
			key = "h",
			action = wezterm.action_callback(function(window, pane)
				active_pane(window, pane, "Left", "h")
			end),
		},
		{
			mods = "CMD",
			key = "j",
			action = wezterm.action_callback(function(window, pane)
				active_pane(window, pane, "Down", "j")
			end),
		},
		{
			mods = "CMD",
			key = "k",
			action = wezterm.action_callback(function(window, pane)
				active_pane(window, pane, "Up", "k")
			end),
		},
		{
			mods = "CMD",
			key = "l",
			action = wezterm.action_callback(function(window, pane)
				active_pane(window, pane, "Right", "l")
			end),
		},
		{
			mods = "CMD|SHIFT",
			key = "m",
			action = wezterm.action_callback(function(window, _)
				if is_maximized then
					window:restore()
				else
					window:maximize()
				end
				is_maximized = not is_maximized
			end),
		},
		{
			mods = "CMD|SHIFT",
			key = "b",
			action = wezterm.action_callback(function(window, _)
				local overrides = window:get_config_overrides() or {}
				if overrides.window_decorations and string.find(overrides.window_decorations, "TITLE") then
					overrides.window_decorations = "NONE|RESIZE"
				else
					overrides.window_decorations = "TITLE|RESIZE"
				end
				window:set_config_overrides(overrides)
			end),
		},
		{
			mods = "CMD|SHIFT",
			key = "n",
			action = wezterm.action.PromptInputLine({
				description = wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Green" } },
					{ Text = "Enter new name for tab:" },
				}),
				action = wezterm.action_callback(function(window, _, line)
					if line and string.len(line) > 0 then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			mods = "CMD|SHIFT",
			key = " ",
			action = wezterm.action.RotatePanes("CounterClockwise"),
		},
	}

	for i = 1, 8 do
		-- CTRL+ALT + number to move to that position
		table.insert(config.keys, {
			mods = "CTRL|ALT",
			key = tostring(i),
			action = wezterm.action.MoveTab(i - 1),
		})

		-- CMD + number => goto tab
		table.insert(config.keys, {
			mods = "CMD",
			key = tostring(i),
			action = wezterm.action_callback(function(window, pane)
				local active_tab_index = nil
				local next_tab_index = i - 1

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
			end),
		})
	end
end

return M
