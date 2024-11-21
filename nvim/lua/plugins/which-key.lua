return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  config = function(_, opts)
    local wk = require("which-key")
    wk.add({
<<<<<<< HEAD
      { "<leader>rn",  ":set relativenumber!<CR>", desc = "Set relativenumber" },

      { "<leader>md",  group = "markdown" },
      { "<leader>mdp", "<Cmd>MarkdownPreview<CR>", desc = "Preview markdown" },

      { "<leader>a",   group = "Apply macro" }
||||||| 7332600
=======
      { "<leader>a", group = "Apply macro" },

      { "<leader>md", group = "markdown" },
      { "<leader>mdp", "<Cmd>MarkdownPreview<CR>", desc = "Preview markdown" },

      { "<leader>rn", ":set relativenumber!<CR>", desc = "Toggle relativenumber" },
>>>>>>> upstream/main
    })
    wk.setup(opts)
  end,
}
