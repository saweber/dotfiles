local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- UI
-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Fonts
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14.0
config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"} -- disable ligatures

-- For example, changing the color scheme:
config.color_scheme = 'Monokai Pro (Gogh)'
config.color_scheme = 'Night Owlish Light'

return config
