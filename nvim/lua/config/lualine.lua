require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "nord",
		component_separators = { "", "" },
		section_separators = { "", "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{ "filename", file_status = true, path = 1 },
			{ "diff" },
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				symbols = { error = "E", warn = "W", info = "I", hint = "H" },
			},
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = {},
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fzf", "nvim-tree", "fugitive" },
})
