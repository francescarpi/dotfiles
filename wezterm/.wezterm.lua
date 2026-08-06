local wezterm = require("wezterm")
local theme = require("theme")
local keybindings = require("keybindings")
local sessions = wezterm.plugin.require("https://github.com/abidibo/wezterm-sessions")

-- get default wezterm config
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

theme.setup(config)
keybindings.setup(config)

sessions.apply_to_config(config, {
	-- Auto-save interval in seconds (default: 30)
	auto_save_interval_s = 30,
	-- Warn when git branches changed on restore (default: true)
	git_branch_warn = true,
})

return config
