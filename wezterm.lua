local wezterm = require("wezterm")

local config = {}

-- crude way of determining which machine wezterm is running on
local os_name = tostring(os.getenv("HOSTNAME"))
local is_fedora = string.match(os_name, "fedora")
local is_asahi = string.match(os_name, "asahi")

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- UI
config.hide_tab_bar_if_only_one_tab = true

-- Fonts
config.font = wezterm.font("JetBrains Mono")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- disable ligatures
config.warn_about_missing_glyphs = false -- turn off annoying notifications about a missing glyph

config.font_size = 14.0
if is_fedora then
	config.font_size = 12.0
elseif is_asahi then
	config.font_size = 11.0
end

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Monokai Dark (Gogh)"
	else
		return "Homebrew Light (Gogh)"
	end
end

config.color_scheme = scheme_for_appearance(get_appearance())

-- hack around bad NVIDIA / Wayland support (probably NVIDIA's fault)
if is_fedora then
	local gpus = wezterm.gui.enumerate_gpus()
	config.webgpu_preferred_adapter = gpus[2]
	config.front_end = "OpenGL"
	config.enable_wayland = true
end

return config
