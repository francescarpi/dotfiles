local wezterm = require("wezterm")
local act = wezterm.action
local is_maximized = false

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.color_scheme = "midnight-in-mojave"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 16
config.send_composed_key_when_right_alt_is_pressed = true
config.send_composed_key_when_left_alt_is_pressed = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.999 -- this fix stage manager laggy
config.window_decorations = "NONE|RESIZE"
config.inactive_pane_hsb = {
	-- saturation = 0.1,
	brightness = 0.3,
}
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#fd971f",
			fg_color = "#000000",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
	},
}
config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}

local function isViProcess(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(act.SendKey({ mods = "CTRL|SHIFT", key = vim_direction }), pane)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end

config.keys = {
	{ key = "i", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "i", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "z", mods = "CMD", action = act.TogglePaneZoomState },
	{ key = "p", mods = "CMD", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "CMD", action = act.ActivateTabRelative(1) },
	{ key = "k", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "j", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "l", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "h", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "a", mods = "CMD", action = act.ActivateLastTab },
	{ key = "o", mods = "CMD", action = act.PaneSelect({ alphabet = "1234567890" }) },
	{
		key = "h",
		mods = "CMD",
		action = wezterm.action_callback(function(window, pane)
			conditionalActivatePane(window, pane, "Left", "h")
		end),
	},
	{
		key = "j",
		mods = "CMD",
		action = wezterm.action_callback(function(window, pane)
			conditionalActivatePane(window, pane, "Down", "j")
		end),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action_callback(function(window, pane)
			conditionalActivatePane(window, pane, "Up", "k")
		end),
	},
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action_callback(function(window, pane)
			conditionalActivatePane(window, pane, "Right", "l")
		end),
	},
	{
		key = "m",
		mods = "CMD|SHIFT",
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
		key = "b",
		mods = "CMD|SHIFT",
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
		key = "n",
		mods = "CMD|SHIFT",
		action = act.PromptInputLine({
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
		key = " ",
		mods = "CMD|SHIFT",
		action = act.RotatePanes("CounterClockwise"),
	},
}

for i = 1, 8 do
	-- CTRL+ALT + number to move to that position
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = act.MoveTab(i - 1),
	})

	-- CMD + number => goto tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CMD",
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
				window:perform_action(act.ActivateLastTab, pane)
			else
				window:perform_action(act.ActivateTab(next_tab_index), pane)
			end
		end),
	})
end

return config
