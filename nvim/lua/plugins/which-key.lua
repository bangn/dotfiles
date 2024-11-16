return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    spec = {
      ["<leader>gb"] = { name = "+git blame" },
    },
  }
}
