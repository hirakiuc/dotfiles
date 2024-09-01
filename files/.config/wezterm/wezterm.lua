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
}

return config
