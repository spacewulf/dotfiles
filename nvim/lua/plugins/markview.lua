local plugins = {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		config = function()
			require("config.markview")
		end,
	}
}

return plugins
