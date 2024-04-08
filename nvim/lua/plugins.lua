local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local home = os.getenv("HOME")

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

local packer = require("packer")

vim.g.coq_settings = {
	auto_start = "shut-up",
	keymap = {
		recommended = true,
		jump_to_mark = "<C-f>",
	},
}

return packer.startup({
	function(use)
		use({ "wbthomason/packer.nvim" })

		use({ "arcticicestudio/nord-vim", branch = "main", config = [[require("config.nord-vim")]] })
		use({ "christoomey/vim-tmux-navigator" })
		use({ "danilamihailov/beacon.nvim" })
		use({ "fatih/vim-go", config = [[require("config.vim-go")]] })
		use({ "folke/zen-mode.nvim", config = [[require("config.zen-mode")]] })
		use({ "godlygeek/tabular" })
		use({ "hashivim/vim-terraform", config = [[require("config.vim-terraform")]] })
		use({ "ironhouzi/starlite-nvim", config = [[require("config.starlite-nvim")]] })
		use({ "janko-m/vim-test", config = [[require("config.vim-test")]] })
		use({ "junegunn/fzf", run = "cd " .. home .. "/.fzf && ./install --all" })
		use({ "junegunn/fzf.vim", config = [[require("config.fzf")]] })
		use({ "kylechui/nvim-surround", config = [[ require("nvim-surround").setup({})]] })
		use({ "lukas-reineke/indent-blankline.nvim", config = [[require("config.indent-blankline")]] })
		use({ "michaeljsmith/vim-indent-object" })
		use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
		use({ "ms-jpq/coq_nvim", branch = "coq" })
		use({ "neovim/nvim-lspconfig", config = [[require("config.nvim-lspconfig")]] })
		use({ "neovimhaskell/haskell-vim", config = [[require("config.vim-haskell")]] })
		use({ "ntpeters/vim-better-whitespace" })
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({ "nvim-tree/nvim-web-devicons" })
		use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter/nvim-treesitter" })
		use({ "pantharshit00/vim-prisma" })
		use({ "ruanyl/vim-gh-line" })
		use({ "sheerun/vim-polyglot" })
		use({ "Shougo/vimproc.vim", run = "make" })
		use({ "tpope/vim-abolish" })
		use({ "tpope/vim-bundler" })
		use({ "tpope/vim-commentary", config = [[require("config.vim-commentary")]] })
		use({ "tpope/vim-endwise" })
		use({ "tpope/vim-eunuch" })
		use({ "tpope/vim-fugitive", config = [[require("config.vim-fugitive")]] })
		use({ "tpope/vim-obsession" })
		use({ "tpope/vim-repeat" })
		use({ "tpope/vim-sleuth" })
		use({ "tpope/vim-unimpaired" })
		use({ "w0rp/ale", config = [[require("config.ale")]] })
		use({ "wellle/targets.vim" })
		use({ "wsdjeg/vim-fetch" })

		use({
			"gelguy/wilder.nvim",
			requires = { "romgrk/fzy-lua-native" },
			run = ":UpdateRemotePlugins",
			config = [[require("config.wilder")]],
		})

		use({
			"kevinhwang91/nvim-ufo",
			requires = "kevinhwang91/promise-async",
			config = [[require("config.ufo")]],
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = [[require("config.nvim-treesitter")]],
		})

		use({
			"glacambre/firenvim",
			run = function()
				vim.fn["firenvim#install"](0)
			end,
			config = [[require("config.firenvim")]],
		})

		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = [[require("config.gitsigns")]],
		})

		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope-fzf-native.nvim" },
			},
			config = [[require("config.telescope")]],
		})

		use({
			"hoob3rt/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons", opt = true },
			config = [[require("config.lualine")]],
		})

		use({
			"mzlogin/vim-markdown-toc",
			ft = { "markdown" },
		})
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && git checkout . && yarn install",
			ft = { "markdown" },
			config = [[require("config.markdown-preview")]],
		})

		use({
			"nvim-tree/nvim-tree.lua",
			requires = { "nvim-tree/nvim-web-devicons" },
			config = [[require("config.nvim-tree")]],
		})

		use({
			"sindrets/diffview.nvim",
			requires = { "nvim-tree/nvim-web-devicons" },
			config = [[require("config.diffview")]],
		})
	end,
	config = {
		profile = { enable = true },
		threshold = 1,
	},
})
