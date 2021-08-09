local vim_g = vim.g
local vars = require("utils.vars")

vim_g.vsnip_snippet_dir = "~/dotfiles/nvim/vsnip"

vars.remap.fn("i", "<C-j>", 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"', { expr = true })
vars.remap.fn("i", "<C-k>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-k>"', { expr = true })
