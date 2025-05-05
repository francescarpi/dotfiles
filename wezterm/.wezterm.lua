local wezterm = require("wezterm")
local theme = require("theme")
local keybindings = require("keybindings")

-- get default wezterm config
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

theme.setup(config)
keybindings.setup(config)

return config
