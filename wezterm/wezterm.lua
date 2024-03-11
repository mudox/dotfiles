local wz = require("wezterm")

local config = wz.config_builder()

config.font = wz.font("Iosevka Nerd Font")

config.color_scheme = "AdventureTime"

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8

config.enable_tab_bar = false

return config
