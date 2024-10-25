local wezterm = require("wezterm")
local platform = require("utils.platform")
local act = wezterm.action

local mod = {}

if platform.is_mac then
	mod.SUPER = "SUPER"
	mod.SUPER_REV = "SUPER|CTRL"
elseif platform.is_win or platform.is_linux then
	mod.SUPER = "ALT"
	mod.SUPER_REV = "ALT|CTRL"
end

-- stylua: ignore
local keys = {
  -- misc/useful
  { key = 'F1', mods = 'NONE', action = 'ActivateCopyMode' },
  { key = 'F2', mods = 'NONE', action = act.ActivateCommandPalette },
  { key = 'F3', mods = 'NONE', action = act.ShowLauncher },
  { key = 'F4', mods = 'NONE', action = act.ShowLauncherArgs({ flags = 'FUZZY|TABS' }) },
  {
    key = 'F5',
    mods = 'NONE',
    action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
  },
  { key = 'F11', mods = 'NONE', action = act.ToggleFullScreen },
  { key = 'F12', mods = 'NONE', action = act.ShowDebugOverlay },
  { key = 'f', mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = '' }) },
  {
    key = 'u',
    mods = mod.SUPER,
    action = wezterm.action.QuickSelectArgs({
      label = 'open url',
      patterns = {
        '\\((https?://\\S+)\\)',
        '\\[(https?://\\S+)\\]',
        '\\{(https?://\\S+)\\}',
        '<(https?://\\S+)>',
        '\\bhttps?://\\S+[)/a-zA-Z0-9-]+',
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.log_info('opening: ' .. url)
        wezterm.open_with(url)
      end),
    }),
  },

  -- window --
  -- spawn windows
  { key = 'n', mods = mod.SUPER, action = act.SpawnWindow },
}

local mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
}

return {
	disable_default_key_bindings = true,
	keys = keys,
	mouse_bindings = mouse_bindings,
}
