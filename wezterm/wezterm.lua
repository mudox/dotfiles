local wz = require("wezterm")

local config = wz.config_builder()

config.font = wz.font("IosevkaTerm Nerd Font")

config.color_scheme = "Tokyo Night Moon"

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9

config.enable_tab_bar = false

return config
