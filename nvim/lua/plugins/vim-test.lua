local vim_cmd = vim.cmd
local vars = require("utils.vars")

vars.remap.fn("n", "<leader>t", ":TestNearest<CR>", {})
vars.remap.fn("n", "<leader>c", ":TestFile<CR>", {})
vars.remap.fn("n", "<leader>a", ":TestSuite<CR>", {})
vars.remap.fn("n", "<leader>l", ":TestLast<CR>", {})
vars.remap.fn("n", "<leader>g", ":TestVisit<CR>", {})
vim_cmd([[
  let test#strategy = "neovim"
]])
