local wezterm = require("wezterm")

local config = wezterm.config_builder()

local colorscheme = require("colors.carbon")

config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 12

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.default_prog = { "tmux" }

config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"

config.colors = colorscheme

config.window_background_opacity = 0.8

return config
