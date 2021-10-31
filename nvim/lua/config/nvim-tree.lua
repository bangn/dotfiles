local vim_g = vim.g
local vars = require("utils.vars")

local tree_cb = require("nvim-tree.config").nvim_tree_callback
local bindingsList = {
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
	{ key = { "<2-RightMouse>", "<C-}>" }, cb = tree_cb("cd") },
	{ key = "<C-v>", cb = tree_cb("vsplit") },
	{ key = "<C-x>", cb = tree_cb("split") },
	{ key = "<C-t>", cb = tree_cb("tabnew") },
	{ key = "<", cb = tree_cb("prev_sibling") },
	{ key = ">", cb = tree_cb("next_sibling") },
	{ key = "P", cb = tree_cb("parent_node") },
	{ key = "<BS>", cb = tree_cb("close_node") },
	{ key = "<S-CR>", cb = tree_cb("close_node") },
	{ key = "<Tab>", cb = tree_cb("preview") },
	{ key = "K", cb = tree_cb("first_sibling") },
	{ key = "J", cb = tree_cb("last_sibling") },
	{ key = "I", cb = tree_cb("toggle_ignored") },
	{ key = "H", cb = tree_cb("toggle_dotfiles") },
	{ key = "R", cb = tree_cb("refresh") },
	{ key = "a", cb = tree_cb("create") },
	{ key = "d", cb = tree_cb("remove") },
	{ key = "r", cb = tree_cb("rename") },
	{ key = "<C->", cb = tree_cb("full_rename") },
	{ key = "x", cb = tree_cb("cut") },
	{ key = "c", cb = tree_cb("copy") },
	{ key = "p", cb = tree_cb("paste") },
	{ key = "y", cb = tree_cb("copy_name") },
	{ key = "Y", cb = tree_cb("copy_path") },
	{ key = "gy", cb = tree_cb("copy_absolute_path") },
	{ key = "[c", cb = tree_cb("prev_git_item") },
	{ key = "}c", cb = tree_cb("next_git_item") },
	{ key = "-", cb = tree_cb("dir_up") },
	{ key = "q", cb = tree_cb("close") },
	{ key = "g?", cb = tree_cb("toggle_help") },
}

require("nvim-tree").setup({
	auto_close = true,
	disable_netrw = true,
	hide_dotfiles = 0,
	hijack_cursor = false,
	hijack_netrw = true,
	ignore_ft_on_setup = {},
	open_on_setup = false,
	update_cwd = false,
	diagnostics = {
		enable = false,
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	view = {
		width = 40,
		side = "left",
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = bindingsList,
		},
	},
	ignore = {
		"node_modules",
		".cache",
	},
})

vim_g.nvim_tree_quit_on_open = 0
vim_g.nvim_tree_indent_markers = 1
vim_g.nvim_tree_git_hl = 1
vim_g.nvim_tree_root_folder_modifier = ":~"
vim_g.nvim_tree_allow_resize = 1

vim_g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
}

vim_g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "✗",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "★",
	},

	folder = {
		default = "",
		empty = "",
		empty_open = "",
		open = "",
		symlink = "",
		symlink_open = "",
	},
}

vars.remap.fn("n", "<leader>nt", ":NvimTreeToggle<CR>", { noremap = true })
require("nvim-tree.view").View.winopts.relativenumber = true
