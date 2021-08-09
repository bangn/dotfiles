local vars = require("utils.vars")

vars.remap.fn("n", "<leader>gd", ":Gvdiff<CR>", vars.remap.opts)
vars.remap.fn("n", "<leader>gb", ":Git blame<CR>", vars.remap.opts)
vars.remap.fn("n", "<leader>gps", ":!git push<CR>", vars.remap.opts)
vars.remap.fn("n", "<leader>gs", ":Gstatus<CR>", vars.remap.opts)
vars.remap.fn("n", "<leader>gw", ":Gwrite<CR>", vars.remap.opts)
vars.remap.fn("n", "<leader>gdm", ":Gdiff origin/master<CR>", vars.remap.opts)
vars.remap.fn("n", "<leader>gdd", ":Gdiff origin/develop<CR>", vars.remap.opts)
