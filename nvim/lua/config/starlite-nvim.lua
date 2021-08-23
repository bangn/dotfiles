local vars = require("utils.vars")

vars.remap.fn("n", "*", ":lua require'starlite'.star()<cr>", vars.remap.opts)
vars.remap.fn("n", "g*", ":lua require'starlite'.g_star()<cr>", vars.remap.opts)
vars.remap.fn("n", "#", ":lua require'starlite'.hash()<cr>", vars.remap.opts)
vars.remap.fn("n", "g#", ":lua require'starlite'.g_hash()<cr>", vars.remap.opts)
