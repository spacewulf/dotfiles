local tt = require("toggleterm")

tt.setup({
  size = 10,
  open_mapping = [[<C-t>t]],
  shading_factor = 2,
  direction = "float",
  float_opts = {
    border = "curved",
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})
