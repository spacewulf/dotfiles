local wezterm = require("wezterm")
local config = wezterm.config_builder()
require("colors")

config.color_scheme_dirs = { "/home/$USER/.config/wezterm/colors" }

config.color_scheme = "carbon"

config.font = "CaskaydiaCove Nerd Font"
