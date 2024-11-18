return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
<<<<<<< HEAD
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
||||||| parent of 47a5d2e (nvim: Update lazyvim config)
=======
  opts = {
    spec = {
      ["<leader>gb"] = { name = "+git blame" },
      ["<leader>md"] = { name = "+markdown" },
      ["<leader>a"] = { name = "Apply marcro" },
    },
  },
  keys = {
    { "<leader>qx",  ":x<CR>",                         desc = "Quit current window" },
    { "<leader>rn",  ":set relativenumber!<CR>",       desc = "Set relativenumber" },
    { "<leader>mdp", "<Cmd>MarkdownPreview<CR>",       desc = "Preview markdown" },
    { "<leader>mdr", "<Cmd>RenderMarkdown toggle<CR>", desc = "Render markdown" },
  }
>>>>>>> 47a5d2e (nvim: Update lazyvim config)
}
