local vars = require("utils.vars")

require("lspsaga").init_lsp_saga({
	use_saga_diagnostic_sign = false,
	error_sign = "⤫",
	warn_sign = "⚠",
	code_action_keys = {
		quit = "<esc>",
		exec = "<CR>",
	},
	rename_action_keys = {
		quit = "<esc>",
		exec = "<CR>",
	},
	finder_action_keys = {
		open = "<CR>",
		vsplit = "<C-v>",
		split = "<C-x>",
		quit = "<esc>",
		scroll_down = "<C-n>",
		scroll_up = "<C-p>",
	},
	code_action_icon = "💡",
	code_action_prompt = {
		enable = false,
	},
})

vars.remap.fn("n", "<C-b>", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', vars.remap.opts)
vars.remap.fn("n", "<C-f>", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', vars.remap.opts)
vars.remap.fn("n", "<leader>e", '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', vars.remap.opts)
vars.remap.fn("n", "<leader>gr", '<cmd>lua require("lspsaga.rename").rename()<CR>', vars.remap.opts)
vars.remap.fn("n", "<leader>pd", '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', vars.remap.opts)
vars.remap.fn("n", "[d", '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', vars.remap.opts)
vars.remap.fn("n", "]d", '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', vars.remap.opts)
vars.remap.fn("n", "gh", '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', vars.remap.opts)
vars.remap.fn("n", "gS", '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', vars.remap.opts)
vars.remap.fn("n", "K", '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', vars.remap.opts)
