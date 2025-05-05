local wezterm = require("wezterm")

local M = {}

M.setup = function(config)
	config.color_scheme = "Catppuccin Mocha"
	config.font = wezterm.font("FiraCode Nerd Font")
	config.font_size = 16

	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.window_background_opacity = 0.999 -- this fix stage manager laggy
	config.window_decorations = "NONE|RESIZE"

	config.inactive_pane_hsb = {
		brightness = 0.5,
	}

	config.colors = {
		split = "#ffec9b",
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
end

return M
