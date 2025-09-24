local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font configuration
config.font = wezterm.font('Fira Code', { weight = 'Regular' })
config.font_size = 14.0

-- Enable font ligatures (Fira Code's main feature)
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

-- Optional: Color scheme
config.color_scheme = 'Tomorrow Night'

-- Optional: Window settings
config.window_background_opacity = 1.0
config.window_decorations = "RESIZE"

-- Optional: Tab bar settings
config.hide_tab_bar_if_only_one_tab = true

config.scrollback_lines = 5000


config.disable_default_key_bindings = true
config.leader = { key = 'b', mods = 'CMD', timeout_milliseconds = 2000 }
local keys = {
    { key = 'l', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(1) },
    { key = 'h', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(-1) },
    { key = 'j', mods = 'CMD', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'CMD', action = act.ActivatePaneDirection 'Up' },
    { key = 'f', mods = 'CMD', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'w', mods = 'CMD', action = act.CloseCurrentTab{ confirm = false } },
    { key = 'x', mods = 'CMD', action = act.CloseCurrentPane{ confirm = false } },
    { key = 'Enter', mods = 'CMD', action = act.ActivateCopyMode },
    { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
    { key = '0', mods = 'CTRL', action = act.ResetFontSize },
    { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
}

config.keys = keys


return config
