-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

----------------------------------------
--- Auto save
----------------------------------------
autocmd({ "InsertLeave" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})

-- Prefer creating groups and assigning autocmds to groups, because it makes it
-- easier to clear them
augroup("conceal", { clear = true })

autocmd({ "FileType" }, {
  pattern = { "markdown", "json" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
  group = "conceal",
})
