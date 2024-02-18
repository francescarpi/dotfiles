-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = "Monokai Pro (Gogh)"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 16
config.send_composed_key_when_right_alt_is_pressed = true
config.send_composed_key_when_left_alt_is_pressed = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.999 -- this fix stage manager laggy
-- config.window_decorations = "NONE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.inactive_pane_hsb = {
	saturation = 0.1,
	brightness = 0.5,
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
		window:perform_action(act.SendKey({ key = vim_direction, mods = "CTRL" }), pane)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
	conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
	conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
	conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
	conditionalActivatePane(window, pane, "Down", "j")
end)

config.keys = {
	{ key = "i", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "i", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "z", mods = "CMD", action = wezterm.action.TogglePaneZoomState },
	{ key = "p", mods = "CMD", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "CMD", action = act.ActivateTabRelative(1) },
	{ key = "ñ", mods = "CMD", action = act.ActivateLastTab },
	{ key = "k", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "j", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "l", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "h", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "h", mods = "CMD", action = act.EmitEvent("ActivatePaneDirection-left") },
	{ key = "j", mods = "CMD", action = act.EmitEvent("ActivatePaneDirection-down") },
	{ key = "k", mods = "CMD", action = act.EmitEvent("ActivatePaneDirection-up") },
	{ key = "l", mods = "CMD", action = act.EmitEvent("ActivatePaneDirection-right") },
}

for i = 1, 8 do
	-- CTRL+ALT + number to move to that position
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end

-- fix fullscreen on osx
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
