local api = vim.api;

function toggleZenmode()
 require("zen-mode").toggle({
    window = {
      width = 1,
      height = 1,
    }
  })
end

local mapOpts = { noremap=true, silent=true };

api.nvim_set_keymap('n', '<leader>z', '<cmd>lua toggleZenmode()<CR>', mapOpts);

require("zen-mode").setup {
  window = {
    backdrop = 0.95,
  },
  plugins = {
    gitsigns = true, -- disables git signs
    tmux = false, -- disables the tmux statusline
  },
}
