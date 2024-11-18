return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
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
}
