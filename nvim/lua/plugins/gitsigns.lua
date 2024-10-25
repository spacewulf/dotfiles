return {
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    config = function()
      require('config.gitsigns')
    end
  }
}
