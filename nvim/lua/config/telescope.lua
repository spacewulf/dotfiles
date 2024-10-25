require("telescope").setup()
-- require("telescope").load_extension("cmdline")
require("telescope").load_extension("noice")

local keymap = vim.keymap
local function map(mode, lhs, rhs, description)
	vim.keymap.set(mode, lhs, rhs, { desc = description, silent = true })
end

map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", "Fuzzy find files in cwd")
map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", "Fuzzy find recent files")

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })
-- keymap.set("n", ":", "<cmd>Telescope cmdline<cr>", { desc = "Open commandline" })
-- vim.api.nvim_set_keymap("n", ":", ":Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
-- vim.api.nvim_set_keymap("n", "<leader><leader>", ":Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
