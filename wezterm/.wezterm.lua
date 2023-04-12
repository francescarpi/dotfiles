-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- config.color_scheme = 'Monokai Pro (Gogh)'
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 16
config.send_composed_key_when_right_alt_is_pressed = true
config.send_composed_key_when_left_alt_is_pressed = true

config.keys = {
  {
    key = 'i',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'u',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'z',
    mods = 'CMD',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'h',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Down',
  },
  { key = 'LeftArrow', mods = 'CMD', action = act.ActivateTabRelative(-1) },
  { key = 'RightArrow', mods = 'CMD', action = act.ActivateTabRelative(1) },
}

-- and finally, return the configuration to wezterm
return config
