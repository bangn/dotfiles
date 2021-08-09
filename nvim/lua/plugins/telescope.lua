local vars = require("utils.vars")

vars.remap.fn("n", "<leader>fbc", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>', vars.remap.opts)
vars.remap.fn("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>', vars.remap.opts)
vars.remap.fn("n", "<leader>fgb", '<cmd>lua require("telescope.builtin").git_branches()<cr>', vars.remap.opts)
vars.remap.fn("n", "<leader>fgc", '<cmd>lua require("telescope.builtin").git_commits()<cr>', vars.remap.opts)
vars.remap.fn("n", "<leader>fh", '<cmd>lua require("telescope.builtin").oldfiles()<cr>', vars.remap.opts)
vars.remap.fn(
	"n",
	"<leader>flbd",
	'<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>',
	vars.remap.opts
)
vars.remap.fn("n", "<leader>flca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', vars.remap.opts)
vars.remap.fn("n", "<leader>fld", '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', vars.remap.opts)
vars.remap.fn("n", "<leader>flg", '<cmd>lua require("telescope.builtin").live_grep()<cr>', vars.remap.opts)
vars.remap.fn("n", "<leader>fli", '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', vars.remap.opts)
vars.remap.fn("n", "<leader>flr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>', vars.remap.opts)
vars.remap.fn(
	"n",
	"<leader>flwd",
	'<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>',
	vars.remap.opts
)
vars.remap.fn("n", "<leader>fm", '<cmd>lua require("telescope.builtin").keymaps()<cr>', vars.remap.opts)
vars.remap.fn(
	"n",
	"<leader>fsb",
	'<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>',
	vars.remap.opts
)
vars.remap.fn("n", "<leader>fsc", '<cmd>lua require("telescope.builtin").command_history()<cr>', vars.remap.opts)
vars.remap.fn("n", "<leader>fsh", '<cmd>lua require("telescope.builtin").search_history()<cr>', vars.remap.opts)
vars.remap.fn(
	"n",
	"<leader>fso",
	'<cmd>lua require("telescope.builtin").live_grep({grep_open_files = true})<cr>',
	vars.remap.opts
)
vars.remap.fn("n", "<leader>fsp", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>', vars.remap.opts)
vars.remap.fn(
	"v",
	"<leader>flca",
	'<cmd>lua require("telescope.builtin").lsp_range_code_actions()<cr>',
	vars.remap.opts
)

require("telescope").setup({
	defaults = {
		extensions = {},
		vimgrep_arguments = {
			"rg",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		scroll_strategy = "cycle",
		path_display = {},
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	},
})
