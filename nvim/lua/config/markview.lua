local mv = require("markview")

mv.setup({
  modes = { "n", "no", "c" },
  hybrid_modes = { "n" },
  callbacks = {
    on_enable = function(_, win)
      vim.wo[win].conceallevel = 2
      vim.wo[win].concealcurosr = "c"
    end,
  },
})
