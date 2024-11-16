-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Apply macro with leader key (normal mode)
vim.keymap.set("n", "<leader>m", "@", { desc = "Apply macro" })
-- Apply macro with leader key (visual mode)
vim.keymap.set("x", "<leader>m", "@", { desc = "Apply macro to selection" })

-- SortLines
vim.keymap.set("n", "gs", ":set opfunc=SortLines<CR>g@", {})

-- vim-tmux-navigator
vim.keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", {})
vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", {})
vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", {})
vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", {})

-- ctrl-p
vim.keymap.set("n", "<C-p>", "<Cmd>Telescope find_files<CR>", {})
