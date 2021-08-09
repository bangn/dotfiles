local vim_g = vim.g
local vars = require("utils.vars")

vim_g["nnn#set_default_mappings"] = 0
vim_g["nnn#command"] = "nnn -H"
vim_g["nnn#layout"] = {
	window = {
		width = 0.9,
		height = 0.6,
		highlight = "Debug",
	},
}

local cx = "<c-x>"
local cv = "<c-v>"
vim_g["nnn#action"] = {
	[cx] = "split",
	[cv] = "vsplit",
}

vars.remap.fn("n", "<leader>nn", ":NnnPicker<CR>", vars.remap.opts)
