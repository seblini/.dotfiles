local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.75
config.macos_window_background_blur = 0

config.colors = {
	foreground = "#ffffff",
	background = "#0A0402",
}

return config
