local plugins = {
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function()
			require("config.rustaceanvim")
		end,
	}
}

return plugins
