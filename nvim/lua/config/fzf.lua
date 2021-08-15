local vim_g = vim.g
local vars = require("utils.vars")

vim_g.fzf_layout = { window = { width = 0.9, height = 0.6 } }

vars.remap.fn("n", "<leader>rg", ":Rg<space>", { noremap = true })
vars.remap.fn("n", "<C-p>", ":Files<CR>", {})
