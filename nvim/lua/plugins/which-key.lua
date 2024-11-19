return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  config = function(_, opts)
    local wk = require("which-key")
    wk.add({
      { "<leader>rn",  ":set relativenumber!<CR>", desc = "Set relativenumber" },

      { "<leader>md",  group = "markdown" },
      { "<leader>mdp", "<Cmd>MarkdownPreview<CR>", desc = "Preview markdown" },

      { "<leader>a",   group = "Apply macro" }
    })
    wk.setup(opts)
  end,
}
