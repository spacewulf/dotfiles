local wezterm = require("wezterm")
local gpu_adapters = require("utils.gpu_adapter")
local colors = require("colors.carbon")

return {
	animation_fps = 165,
	max_fps = 165,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	webgpu_preferred_adapter = gpu_adapters:pick_best(),

	--fonts
	font = wezterm.font("CaskaydiaCove Nerd Font"),
	font_size = 12,

	--color scheme
	colors = colors,

	--scrollbar
	enable_scroll_bar = true,

	--tab bar
	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,
	use_fancy_tab_bar = false,
	tab_max_width = 25,
	show_tab_index_in_tab_bar = false,
	switch_to_last_active_tab_when_closing_tab = true,

	--window
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_close_confirmation = "NeverPrompt",
	window_frame = {
		active_titlebar_bg = "#090909",
	},
	window_background_opacity = 0.8,

	inactive_pane_hsb = {
		saturation = 1,
		brightness = 1,
	},
}
