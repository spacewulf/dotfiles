local platform = require("utils.platform")

local options = {
	default_prog = {},
	launch_menu = {},
}

if platform.is_win then
	options.default_prog = { "pwsh", "-NoLogo" }
	options.launch_menu = {
		{ label = "PowerShell", args = { "pwsh", "-NoLogo" } },
		{ label = "PowerShell Desktop", args = { "powershell" } },
		{ label = "Command Prompt", args = { "cmd" } },
	}
elseif platform.is_linux then
	options.default_prog = { "tmux" }
	options.launch_menu = {
		{ label = "Bash", args = { "bash", "-l" } },
		{ label = "Fish", args = { "fish", "-l" } },
		{ label = "Zsh", args = { "zsh", "-l" } },
	}
end

return options
