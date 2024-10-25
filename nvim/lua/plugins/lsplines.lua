return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
    dependencies = { "neovim/nvim-lspconfig" },
    enabled = false
  }
}
