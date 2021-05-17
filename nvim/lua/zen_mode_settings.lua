local api = vim.api;

local mapOpts = { noremap=true, silent=true };
api.nvim_set_keymap('n', '<leader>z', '<cmd>lua  require("zen-mode").toggle({})<CR>', mapOpts);

require("zen-mode").setup {
  window = {
    backdrop = 0.95,
    width = 1,
    height = 1,
  },
  plugins = {
    gitsigns = false, -- disables git signs
    tmux = false, -- disables the tmux statusline
  },
}
