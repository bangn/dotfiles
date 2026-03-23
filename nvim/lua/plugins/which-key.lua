return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  config = function(_, opts)
    local wk = require("which-key")
    wk.add({
      { "<leader>a", group = "Apply macro" },

      { "<leader>pt", "<Cmd>Preview toggle<CR>", desc = "toggle preview" },

      { "<leader>rn", ":set relativenumber!<CR>", desc = "Toggle relativenumber" },

      -- CodeDiff plugin
      { "<leader>cd", ":CodeDiff<CR>", desc = "Toggle CodeDiff" },
    })
    wk.setup(opts)
  end,
}
