-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- COQ settings
vim.g.coq_v1 = true
vim.g.coq_settings = {
  keymap = {
    recommended = true,
    jump_to_mark = vim.NIL,
  },
  limits = {
    completion_auto_timeout = 0.2,
    completion_manual_timeout = 0.2,
  },
  auto_start = true,
}
