return {
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "config.lspconfig"
		end,
	},
	{
		"rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
	},
	{
		'hrsh7th/cmp-nvim-lsp'
	},
	{
		'hrsh7th/nvim-cmp',
		opts = {
			performance = {
				debounce = 0,
				throttle = 0,
			},
		},
	},
	{
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip'
	},
}
