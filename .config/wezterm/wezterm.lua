local wezterm = require 'wezterm';
local act = wezterm.action

return {
  adjust_window_size_when_changing_font_size = true,
  color_scheme = 'Dracula',
  disable_default_key_bindings = true,
  font = wezterm.font_with_fallback {
    {
      family = 'HackGen Console',
      weight = 'Regular',
    },
    {
      family = 'JetBrains Mono',
      weight = 'Regular',
      harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    }
  },
  font_size = 12.0,
  hide_tab_bar_if_only_one_tab = true,
  initial_cols = 160,
  initial_rows = 50,
  keys = {
    { key = 'v', mods = 'CMD', action = act.PasteFrom 'Clipboard' },
  },
  use_ime = true,
  window_background_opacity = 0.9,
  window_padding = {
    left = 4,
    right = 4,
    top = 4,
    bottom = 4,
  },
}
