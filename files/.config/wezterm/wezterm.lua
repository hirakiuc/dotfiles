local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Sonokai (Gogh)'
config.font = wezterm.font 'SauceCodePro Nerd Font'
config.font_size = 14.0

config.window_background_opacity = 0.8

config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = 'w', mods = 'LEADER', action = wezterm.action.ShowTabNavigator },
  { key = 'c', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },

  { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Up' },

  { key = 'H', mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
  { key = 'L', mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
  { key = 'J', mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },
  { key = 'K', mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },

  { key = '-', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '|', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },

  { key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.5,
}

return config
