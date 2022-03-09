require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	ignore_install = { "" }, -- List of parsers to ignore installing

	autopairs = {
		enable = true,
	},

	autotag = {
		enable = true,
	},

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		use_languagetree = false,
		additional_vim_regex_highlighting = true,
	},

	indent = {
		enable = true,
		disable = { "" },
	},

	rainbow = {
		enable = true,
		extended_mode = true,
	},

	textobjects = {
		select = {
			enable = true,

			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},

		move = {
			enable = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})
