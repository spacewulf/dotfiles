require("config.lazy")
require("mini.pairs").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").lua_ls.setup {}

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

