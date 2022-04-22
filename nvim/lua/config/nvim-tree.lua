local vim_g = vim.g
local vars = require("utils.vars")

local tree_cb = require("nvim-tree.config").nvim_tree_callback
local bindingsList = {
	{ key = "-", cb = tree_cb("dir_up") },
	{ key = "<", cb = tree_cb("prev_sibling") },
	{ key = "<BS>", cb = tree_cb("close_node") },
	{ key = "<C->", cb = tree_cb("full_rename") },
	{ key = "<C-k>", action = "" },
	{ key = "<C-t>", cb = tree_cb("tabnew") },
	{ key = "<C-v>", cb = tree_cb("vsplit") },
	{ key = "<C-x>", cb = tree_cb("split") },
	{ key = "<S-CR>", cb = tree_cb("close_node") },
	{ key = "<Tab>", cb = tree_cb("preview") },
	{ key = ">", cb = tree_cb("next_sibling") },
	{ key = "[c", cb = tree_cb("prev_git_item") },
	{ key = "a", cb = tree_cb("create") },
	{ key = "c", cb = tree_cb("copy") },
	{ key = "d", cb = tree_cb("remove") },
	{ key = "g?", cb = tree_cb("toggle_help") },
	{ key = "gy", cb = tree_cb("copy_absolute_path") },
	{ key = "H", cb = tree_cb("toggle_dotfiles") },
	{ key = "I", cb = tree_cb("toggle_ignored") },
	{ key = "J", cb = tree_cb("last_sibling") },
	{ key = "K", cb = tree_cb("first_sibling") },
	{ key = "P", cb = tree_cb("parent_node") },
	{ key = "p", cb = tree_cb("paste") },
	{ key = "q", cb = tree_cb("close") },
	{ key = "R", cb = tree_cb("refresh") },
	{ key = "r", cb = tree_cb("rename") },
	{ key = "x", cb = tree_cb("cut") },
	{ key = "y", cb = tree_cb("copy_name") },
	{ key = "Y", cb = tree_cb("copy_path") },
	{ key = "}c", cb = tree_cb("next_git_item") },
	{ key = { "<2-RightMouse>", "<C-}>" }, cb = tree_cb("cd") },
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
}

require("nvim-tree").setup({
	hide_dotfiles = false,
	auto_reload_on_write = true,
	disable_netrw = false,
	hide_root_folder = false,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_setup_file = false,
	open_on_tab = false,
	sort_by = "name",
	update_cwd = false,
	view = {
		width = 30,
		height = 30,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = bindingsList,
		},
	},
	renderer = {
		indent_markers = {
			enable = false,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	ignore_ft_on_setup = {},
	system_open = {
		cmd = nil,
		args = {},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			diagnostics = false,
			git = false,
			profile = false,
		},
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
