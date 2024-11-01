local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "rose-pine"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 18

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.6
config.macos_window_background_blur = 10

return config
