local vars = require("utils.vars")

vars.remap.fn("n", "<leader>z", '<cmd>lua  require("zen-mode").toggle({})<CR>', vars.remap.opts)

require("zen-mode").setup({
	window = {
		backdrop = 0.95,
		width = 1,
		height = 1,
	},
	plugins = {
		gitsigns = false, -- disables git signs
		tmux = false, -- disables the tmux statusline
	},
})
