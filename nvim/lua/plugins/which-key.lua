return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  config = function(_, opts)
    local wk = require("which-key")
    wk.add({
      { "<leader>a", group = "Apply macro" },

      { "<leader>md", group = "markdown" },
      { "<leader>mdp", "<Cmd>MarkdownPreview<CR>", desc = "Preview markdown" },

      { "<leader>rn", ":set relativenumber!<CR>", desc = "Toggle relativenumber" },
    })
    wk.setup(opts)
  end,
}
