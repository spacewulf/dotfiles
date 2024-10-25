return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile", "User FilePost" },
		dependencies = {
			"nvim-lua/lsp-status.nvim",
		},
		config = function()
			require("config.lspconfig")
		end,
	},
}
