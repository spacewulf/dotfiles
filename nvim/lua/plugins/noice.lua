return {
  {
    'folke/noice.nvim',
    event = "VeryLazy",
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('config.noice')
    end
  }
}
