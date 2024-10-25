local platform = require("utils.platform")

local options = {
	default_prog = {},
}

if platform.is_win then
	options.default_prog = { "pwsh", "-NoLogo" }
elseif platform.is_linux then
	options.default_prog = { "tmux" }
end

return options
