return {
<<<<<<< HEAD
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
||||||| parent of ebf9337 (nvim: Use lazyvim config)
=======
  "christoomey/vim-tmux-navigator",
  lazy = false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<a-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<a-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
>>>>>>> ebf9337 (nvim: Use lazyvim config)
  },
}
