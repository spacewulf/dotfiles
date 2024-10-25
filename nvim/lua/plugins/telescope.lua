return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
        -- "jonarrien/telescope-cmdline.nvim",
        "junegunn/gv.vim",
        "junegunn/fzf.vim",
      }
    },
    config = function()
      require("config.telescope")
    end
  }
}
