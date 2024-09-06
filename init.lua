require("config.lazy")
require("mini.pairs").setup()
require("mason").setup({
	PATH = "prepend",
})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pylyzer", "bashls", "jsonls" }
})

require("mason-lspconfig").setup_handlers {
	function (server_name)
		require("lspconfig")[server_name].setup {}
	end,

}

require("dapui").setup()
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").pylyzer.setup {}

-- vim.wo.number = true
-- vim.wo.relativenumber = true

local set = vim.opt

set.tabstop = 4
set.number = true
set.relativenumber = true
set.shiftwidth = 4

vim.cmd([[
	let g:airline_theme = 'catppuccin'
]])

vim.opt.mouse = 'a'

vim.opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
