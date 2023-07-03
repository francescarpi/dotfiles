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
config.font_size = 14
config.send_composed_key_when_right_alt_is_pressed = true
config.send_composed_key_when_left_alt_is_pressed = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.inactive_pane_hsb = {
  saturation = 0.1,
  brightness = 0.5,
}

config.keys = {
  { key = 'i',  mods = 'CMD',       action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'u',  mods = 'CMD',       action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'z',  mods = 'CMD',       action = wezterm.action.TogglePaneZoomState },
  { key = 'h',  mods = 'CMD',       action = act.ActivatePaneDirection 'Left' },
  { key = 'l',  mods = 'CMD',       action = act.ActivatePaneDirection 'Right' },
  { key = 'k',  mods = 'CMD',       action = act.ActivatePaneDirection 'Up' },
  { key = 'j',  mods = 'CMD',       action = act.ActivatePaneDirection 'Down' },
  { key = 'p',  mods = 'CMD',       action = act.ActivateTabRelative(-1) },
  { key = 'n',  mods = 'CMD',       action = act.ActivateTabRelative(1) },
  { key = 'ñ', mods = 'CMD',       action = act.ActivateLastTab },
  { key = 'k',  mods = 'CMD|SHIFT', action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'j',  mods = 'CMD|SHIFT', action = act.AdjustPaneSize { 'Down', 5 } },
  { key = 'l',  mods = 'CMD|SHIFT', action = act.AdjustPaneSize { 'Right', 5 } },
  { key = 'h',  mods = 'CMD|SHIFT', action = act.AdjustPaneSize { 'Left', 5 } },
}

for i = 1, 8 do
  -- CTRL+ALT + number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|ALT',
    action = wezterm.action.MoveTab(i - 1),
  })
end

config.window_padding = {
  left = 3,
  right = 3,
  top = 3,
  bottom = 3,
}

-- config.window_background_opacity = 0.9

-- and finally, return the configuration to wezterm
return config
