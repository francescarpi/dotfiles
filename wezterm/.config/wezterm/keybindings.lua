local wezterm = require("wezterm")
local actions = require("actions")
local utils = require("utils")

local M = {}

M.setup = function(config)
	config.send_composed_key_when_right_alt_is_pressed = true
	config.send_composed_key_when_left_alt_is_pressed = true

	config.keys = {}

	local function bind(mods, key, fn, ...)
		local args = { ... }
		table.insert(config.keys, {
			mods = mods,
			key = key,
			action = wezterm.action_callback(function(window, pane)
				fn(window, pane, table.unpack(args))
			end),
		})
	end

	local function bind_action(mods, key, action)
		table.insert(config.keys, { mods = mods, key = key, action = action })
	end

	bind("CMD", "d", actions.split_pane, "right")
	bind("CMD|SHIFT", "d", actions.split_pane, "down")

	bind("CMD|SHIFT", "p", actions.activate_tab, "previous")
	bind("CMD|SHIFT", "n", actions.activate_tab, "next")

	bind("CMD", "p", actions.activate_workspace, "previous")
	bind("CMD", "n", actions.activate_workspace, "next")

	bind("CMD", "z", actions.toggle_zoom)

	bind("CMD|SHIFT", "k", actions.resize_pane, "Up")
	bind("CMD|SHIFT", "j", actions.resize_pane, "Down")
	bind("CMD|SHIFT", "l", actions.resize_pane, "Right")
	bind("CMD|SHIFT", "h", actions.resize_pane, "Left")

	bind("CMD", "h", actions.active_pane, "Left", "h")
	bind("CMD", "j", actions.active_pane, "Down", "j")
	bind("CMD", "k", actions.active_pane, "Up", "k")
	bind("CMD", "l", actions.active_pane, "Right", "l")

	bind_action("CMD", "a", wezterm.action.ActivateLastTab)
	bind_action("CMD", "o", wezterm.action.PaneSelect({ alphabet = "1234567890" }))

	bind("CMD|SHIFT", "m", function(window)
		local old = window:get_dimensions()
		window:maximize()
		local new = window:get_dimensions()
		if old.pixel_width == new.pixel_width and old.pixel_height == new.pixel_height then
			window:restore()
		end
	end)

	bind("CMD|SHIFT", "b", function(window)
		local overrides = window:get_config_overrides() or {}
		if overrides.window_decorations and string.find(overrides.window_decorations, "TITLE") then
			overrides.window_decorations = "NONE|RESIZE"
		else
			overrides.window_decorations = "TITLE|RESIZE"
		end
		window:set_config_overrides(overrides)
	end)

	table.insert(config.keys, {
		mods = "CMD|SHIFT",
		key = "r",
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
	})

	bind("CMD|SHIFT", " ", actions.rotate_panes)
	bind("CMD", "t", actions.new_tab)

	for i = 1, 8 do
		bind_action("CTRL|ALT", tostring(i), wezterm.action.MoveTab(i - 1))
		bind("CMD", tostring(i), actions.goto_workspace_or_tab, i)
		bind("CMD|SHIFT", tostring(i), actions.goto_tab_or_workspace, i)
	end

	return config
end

return M
