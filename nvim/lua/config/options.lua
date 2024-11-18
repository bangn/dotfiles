-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- COQ settings
vim.g.coq_settings = {
  auto_start = "shut-up",
  keymap = {
    recommended = true,
    jump_to_mark = "<C-f>",
  },
}
