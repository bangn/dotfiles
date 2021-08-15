local vim_options = vim.o
local vars = require("utils.vars")

vim_options.completeopt = "menu,menuone,noselect"

local opts = { expr = true }

vars.remap.fn("i", "<C-Space>", "compe#complete()", opts)
vars.remap.fn("i", "<C-y>", 'compe#confirm("<C-y>")', opts)
vars.remap.fn("i", "<C-e>", 'compe#close("<C-e>")', opts)

require("compe").setup({
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "disable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		max_width = 120,
		min_width = 60,
		max_height = math.floor(vim_options.lines * 0.3),
		min_height = 1,
	},

	source = {
		path = true,
		buffer = true,
		calc = true,
		vsnip = true,
		nvim_lsp = true,
		nvim_lua = true,
		neorg = true,
		treesitter = true,
	},
})
