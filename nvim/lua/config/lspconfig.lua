local mason_lspconfig = require("mason-lspconfig")

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason_lspconfig.setup()

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
		})
	end,
})

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename using the current LSP" })
