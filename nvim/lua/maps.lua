vim.g.mapleader = " "

local function map(mode, lhs, rhs, description)
	vim.keymap.set(mode, lhs, rhs, { desc = description, silent = true })
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>", "Write current file")
map("n", "<leader>wq", "<CMD>wq<CR>", "Write current file and quit")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>", "Quit")

-- Exit insert mode
map("i", "jk", "<ESC>", "Exit insert mode")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>", "Toggle Neotree")
map("n", "<leader>rr", "<CMD>Neotree focus<CR>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>", "Create vertical split")
map("n", "<leader>p", "<CMD>split<CR>", "Create horizontal split")

-- Window Navigation
map("n", "<leader>h", "<C-w>h", "Navigate window left")
map("n", "<leader>l", "<C-w>l", "Navigate window right")
map("n", "<leader>k", "<C-w>k", "Navigate window up")
map("n", "<leader>j", "<C-w>j", "Navigate window down")

-- Resize Windows
map("n", "<C-Left>", "<C-w><", "Resize border left")
map("n", "<C-Right>", "<C-w>>", "Resize border right")
map("n", "<C-Up>", "<C-w>+", "Resize border up")
map("n", "<C-Down>", "<C-w>-", "Resize border down")

-- Text Handling
map("n", "<leader>ss", "i<CR><ESC>", "Insert linebreak at cursor")
