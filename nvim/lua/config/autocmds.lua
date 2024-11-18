-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
<<<<<<< HEAD
<<<<<<< HEAD

local autocmd = vim.api.nvim_create_autocmd

----------------------------------------
--- Auto save
----------------------------------------
autocmd({ "BufLeave", "FocusLost" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})
||||||| parent of ebf9337 (nvim: Use lazyvim config)
=======
>>>>>>> ebf9337 (nvim: Use lazyvim config)
||||||| parent of 953bdee (nvim: Add autosave autocmds)
=======

----------------------------------------
--- Auto save
----------------------------------------
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})
>>>>>>> 953bdee (nvim: Add autosave autocmds)
