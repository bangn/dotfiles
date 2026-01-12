-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

----------------------------------------
-- Macro
----------------------------------------
vim.keymap.set("n", "<leader>am", "@", { desc = "Apply macro" })
vim.keymap.set("x", "<leader>am", "@", { desc = "Apply macro to selection" })

----------------------------------------
-- vim-tmux-navigator
----------------------------------------
vim.keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", {})
vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", {})
vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", {})
vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", {})

----------------------------------------
-- ctrl-p
----------------------------------------
vim.keymap.set("n", "<C-p>", "<Cmd>Telescope find_files<CR>", {})

----------------------------------------
-- Use default 's' and 'S' in normal, visual, and operator-pending modes
----------------------------------------
vim.keymap.del({ "n", "x", "o" }, "s")
vim.keymap.del({ "n", "x", "o" }, "S")

----------------------------------------
-- CodeDiff
----------------------------------------
vim.keymap.set("n", "<leader>dv", ":CodeDiff<CR>")
