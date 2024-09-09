local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Sonokai (Gogh)'
config.font = wezterm.font 'SauceCodePro Nerd Font'
config.font_size = 14.0

config.window_background_opacity = 0.8

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  { key = 'w', mods = 'LEADER', action = wezterm.action.ShowTabNavigator },
  { key = 'c', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },
  { key = 'n', mods = 'LEADER', action = wezterm.action.SpawnWindow },

  { key = 'P', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateCommandPalette },

  { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Up' },

  { key = '-', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '|', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },

  { key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },

  {
    key = 'r',
    mods = 'LEADER',
    action = wezterm.action.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
      timeout_milliseconds = 1000,
    },
  },

  { key = 's', mods = 'LEADER', action = wezterm.action.Search 'CurrentSelectionOrEmptyString' },
  { key = '?', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },
}

config.key_tables = {
  resize_pane = {
    { key = 'h', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
    { key = 'l', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
    { key = 'j', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },
    { key = 'k', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },

    { key = 'Escape', action = 'PopKeyTable' },
  },

  -- https://github.com/wez/wezterm/issues/1592#issuecomment-1118722289
  copy_mode = {
    { key = 'Escape', mods = 'NONE', action = wezterm.action{ CopyMode = 'Close' } },
    { key = '[', mods = 'CTRL', action = wezterm.action{ CopyMode = 'Close' } },

    { key = 'h', mods = 'NONE', action = wezterm.action{ CopyMode = 'MoveLeft' } },
    { key = 'j', mods = 'NONE', action = wezterm.action{ CopyMode = 'MoveDown' } },
    { key = 'k', mods = 'NONE', action = wezterm.action{ CopyMode = 'MoveUp' } },
    { key = 'l', mods = 'NONE', action = wezterm.action{ CopyMode = 'MoveRight' } },
    { key = '0', mods = 'NONE', action = wezterm.action{ CopyMode = 'MoveToStartOfLine' } },
    { key = '$', mods = 'NONE', action = wezterm.action{ CopyMode = 'MoveToEndOfLineContent' } },
    { key = 'w', mods = 'NONE', action = wezterm.action{ CopyMode = 'MoveForwardWord' } },
    { key = 'b', mods = 'NONE', action = wezterm.action{ CopyMode = 'MoveBackwardWord' } },

    { key = 'f', mods = 'CTRL',   action = wezterm.action.ScrollByPage(1.0) },
    { key = 'b', mods = 'CTRL',   action = wezterm.action.ScrollByPage(-1.0) },

    { key = 'v', mods = 'NONE', action = wezterm.action{ CopyMode = { SetSelectionMode = 'Cell' } } },
    {
      key = 'y',
      mods = 'NONE',
      action = wezterm.action.Multiple {
        { CopyTo = 'ClipboardAndPrimarySelection' },
        { CopyMode = 'MoveToScrollbackBottom' },
        { CopyMode = 'Close' },
        { CopyMode = 'Close' },
      },
    },

    -- Enter search mode to edit the pattern.
    -- When the search pattern is an empty string the existing pattern is preserved
    { key = '/', mods = 'NONE', action = wezterm.action.Search { CaseInSensitiveString = '' } },
    -- navigate any search mode results
    { key = 'n', mods = 'NONE', action = wezterm.action{ CopyMode = 'NextMatch' } },
    { key = 'N', mods = 'SHIFT', action = wezterm.action{ CopyMode = 'PriorMatch' } },
  },
  search_mode = {
    {
      key = 'Escape',
      mods = 'NONE',
      action = wezterm.action.Multiple{
        { CopyMode = 'MoveToScrollbackBottom'},
        { CopyMode = 'Close' },
      },
    },
    {
      key = '[',
      mods = 'CTRL',
      action = wezterm.action.Multiple{
        { CopyMode = 'MoveToScrollbackBottom'},
        { CopyMode = 'Close' },
      },
    },

    { key = 'Enter', mods = 'NONE', action = wezterm.action.ActivateCopyMode },
  },
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.5,
}

return config
