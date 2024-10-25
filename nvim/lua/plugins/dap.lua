return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      require("config.dap")
    end
  }
}
