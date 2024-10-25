local global = vim.g
local o = vim.opt

vim.diagnostic.config({
	virtual_text = false,
})

global.loaded_netrw = 1
global.loaded_netrwPlugin = 1

o.number = true
o.relativenumber = true
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.encoding = "UTF-8"
o.ruler = true
o.title = true
o.termguicolors = true
o.hidden = false

-- Minimum number of lines to keep on screen above and below the cursor
o.scrolloff = 10

-- See how neovim will display certian whitespace characters in the editor
o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Sync clipboard with OS and load after UiEnter because it can increase startup-speed
vim.schedule(function()
	o.clipboard = "unnamedplus"
end)

-- Hide mode since it's already shown on the statusline
o.showmode = false

-- Case-insensitive searching unless \C or one or more capital letters is in the search term
o.ignorecase = true
o.smartcase = true

require("config.lazy")
require("maps")
