local wezterm = require 'wezterm'
local act = wezterm.action
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Detect platform and set platform speific settings
local mod = 'CMD'
if wezterm.target_triple:find("windows") then
  mod = 'CTRL'
  config.default_prog = { 'pwsh.exe' }
end

bar.apply_to_config(config, {
  position = "bottom",
  max_width = 32,
  padding = {
    left = 1,
    right = 1,
    tabs = {
      left = 0,
      right = 2,
    },
  },
  separator = {
    space = 1,
    left_icon = wezterm.nerdfonts.fa_long_arrow_right,
    right_icon = wezterm.nerdfonts.fa_long_arrow_left,
    field_icon = wezterm.nerdfonts.indent_line,
  },
  modules = {
    tabs = {
      active_tab_fg = 4,
      inactive_tab_fg = 6,
      new_tab_fg = 2,
    },
    workspace = {
      enabled = true,
      icon = wezterm.nerdfonts.cod_window,
      color = 8,
    },
    leader = {
      enabled = true,
      icon = wezterm.nerdfonts.oct_rocket,
      color = 2,
    },
    zoom = {
      enabled = false,
      icon = wezterm.nerdfonts.md_fullscreen,
      color = 4,
    },
    pane = {
      enabled = true,
      icon = wezterm.nerdfonts.cod_multiple_windows,
      color = 7,
    },
    username = {
      enabled = true,
      icon = wezterm.nerdfonts.fa_user,
      color = 6,
    },
    hostname = {
      enabled = true,
      icon = wezterm.nerdfonts.cod_server,
      color = 8,
    },
    clock = {
      enabled = true,
      icon = wezterm.nerdfonts.md_calendar_clock,
      format = "%H:%M",
      color = 5,
    },
    cwd = {
      enabled = true,
      icon = wezterm.nerdfonts.oct_file_directory,
      color = 7,
    },
    spotify = {
      enabled = false,
      icon = wezterm.nerdfonts.fa_spotify,
      color = 3,
      max_width = 64,
      throttle = 15,
    },
  },
})
-- Font configuration
config.font = wezterm.font('FiraCode Nerd Font Mono', { weight = 'Regular' })
config.font_size = 14.0

-- Enable font ligatures (Fira Code's main feature)
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

-- Optional: Color scheme
-- config.color_scheme = 'Tomorrow Night'

-- config.colors = {
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }

config.colors = {
  -- Basic colors
  foreground = '#abb2bf',
  background = '#282c34',
  
  -- Cursor colors
  cursor_bg = '#528bff',
  cursor_fg = '#282c34',
  cursor_border = '#528bff',
  
  -- Selection colors
  selection_fg = '#abb2bf',
  selection_bg = '#3e4451',
  
  -- Scrollbar
  scrollbar_thumb = '#5c6370',
  
  -- Split borders
  split = '#181a1f',
  
  -- ANSI colors (normal)
  ansi = {
    '#282c34', -- black
    '#e06c75', -- red
    '#98c379', -- green
    '#e5c07b', -- yellow
    '#61afef', -- blue
    '#c678dd', -- magenta
    '#56b6c2', -- cyan
    '#abb2bf', -- white
  },
  
  -- ANSI colors (bright)
  brights = {
    '#5c6370', -- bright black (gray)
    '#e06c75', -- bright red
    '#98c379', -- bright green
    '#e5c07b', -- bright yellow
    '#61afef', -- bright blue
    '#c678dd', -- bright magenta
    '#56b6c2', -- bright cyan
    '#ffffff', -- bright white
  },
  
  -- Tab bar colors
  tab_bar = {
    background = '#21252b',
    active_tab = {
      bg_color = '#282c34',
      fg_color = '#abb2bf',
      intensity = 'Normal',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = '#21252b',
      fg_color = '#5c6370',
      intensity = 'Normal',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },
    inactive_tab_hover = {
      bg_color = '#2c313c',
      fg_color = '#abb2bf',
      intensity = 'Normal',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },
    new_tab = {
      bg_color = '#21252b',
      fg_color = '#5c6370',
    },
    new_tab_hover = {
      bg_color = '#2c313c',
      fg_color = '#abb2bf',
    },
  },
}

-- Optional: Window settings
config.window_background_opacity = 1.0
config.window_decorations = "RESIZE"

-- Optional: Tab bar settings
-- config.hide_tab_bar_if_only_one_tab = true

config.scrollback_lines = 5000


config.disable_default_key_bindings = true


config.leader = { key = 'b', mods = mod, timeout_milliseconds = 2000 }
local keys = {
    { key = 'l', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(1) },
    { key = 'h', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(-1) },
    { key = 'h', mods = mod, action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = mod, action = act.ActivatePaneDirection 'Right' },
    { key = 'j', mods = mod, action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = mod, action = act.ActivatePaneDirection 'Up' },
    { key = 'f', mods = mod, action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'd', mods = mod, action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 't', mods = mod, action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'w', mods = mod, action = act.CloseCurrentTab{ confirm = false } },
    { key = 'x', mods = mod, action = act.CloseCurrentPane{ confirm = false } },
    { key = 'Enter', mods = mod, action = act.ActivateCopyMode },
    { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
    { key = '0', mods = 'CTRL', action = act.ResetFontSize },
    { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
    { key = 'p', mods = 'LEADER', action = act.PasteFrom 'Clipboard' },
    { key = 'v', mods = mod, action = act.PasteFrom 'Clipboard'},
    -- switch to next/previous tab
    {
      key = 'LeftArrow',
      mods = 'OPT|CMD',
      action = act.ActivateTabRelative(-1)
    },
    {
      key = 'RightArrow',
      mods = 'OPT|CMD',
      action = act.ActivateTabRelative(1)
    },
    -- move tab right/left
    { key = '{', mods = mod, action = act.MoveTabRelative(-1) },
    { key = '}', mods = mod, action = act.MoveTabRelative(1) },

    { key = 'o', mods = 'LEADER', action = wezterm.action.QuickSelect },
}

for i = 1, 8 do
  -- MOD + number to activate that tab
  table.insert(keys, {
    key = tostring(i),
    mods = mod,
    action = act.ActivateTab(i - 1),
  })
  -- F1 through F8 to activate that tab
  table.insert(keys, {
    key = 'F' .. tostring(i),
    action = act.ActivateTab(i - 1),
  })
end

config.keys = keys


-- Tab title formatting
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 999

function get_max_cols(window)
  local tab = window:active_tab()
  local cols = tab:get_size().cols
  return cols
end

wezterm.on(
  'window-config-reloaded',
  function(window)
    wezterm.GLOBAL.cols = get_max_cols(window)
  end
)

wezterm.on(
  'window-resized',
  function(window, pane)
    wezterm.GLOBAL.cols = get_max_cols(window)
  end
)

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab.active_pane.title
    local full_title = '[' .. tab.tab_index + 1 .. '] ' .. title
    local pad_length = (wezterm.GLOBAL.cols // #tabs - #full_title) // 2
    if pad_length * 2 + #full_title > max_width then
      pad_length = (max_width - #full_title) // 2
    end
    return string.rep(' ', pad_length) .. full_title .. string.rep(' ', pad_length)
  end
)


return config
