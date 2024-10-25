return {
  {
    "saghen/blink.cmp",
    event = "BufReadPre",
    version = "v0.*",
    config = function()
      require("config.blink-cmp")
    end
  }
}
