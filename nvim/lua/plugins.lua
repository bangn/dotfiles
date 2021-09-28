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
		jump_to_mark = "<C-q>",
	},
}

return packer.startup({
	function(use)
		use("wbthomason/packer.nvim")

		use("christoomey/vim-tmux-navigator")
		use("godlygeek/tabular")
		use("michaeljsmith/vim-indent-object")
		use("ntpeters/vim-better-whitespace")
		use("sheerun/vim-polyglot")
		use("tpope/vim-abolish")
		use("tpope/vim-bundler")
		use("tpope/vim-endwise")
		use("tpope/vim-eunuch")
		use("tpope/vim-obsession")
		use("tpope/vim-repeat")
		use("tpope/vim-sleuth")
		use("tpope/vim-surround")
		use("tpope/vim-unimpaired")
		use("vuki656/package-info.nvim")
		use("wellle/targets.vim")
		use("wsdjeg/vim-fetch")
		use({ "arcticicestudio/nord-vim", config = [[require("config.nord-vim")]] })
		use({ "fatih/vim-go", config = [[require("config.vim-go")]] })
		use({ "folke/zen-mode.nvim", config = [[require("config.zen-mode")]] })
		use({ "gelguy/wilder.nvim", requires = { "romgrk/fzy-lua-native" }, run = ":UpdateRemotePlugins" })
		use({ "glepnir/lspsaga.nvim", config = [[require("config.lspsaga")]] })
		use({ "hashivim/vim-terraform", config = [[require("config.vim-terraform")]] })
		use({ "ironhouzi/starlite-nvim", config = [[require("config.starlite-nvim")]] })
		use({ "janko-m/vim-test", config = [[require("config.vim-test")]] })
		use({ "junegunn/fzf", run = "cd " .. home .. "/.fzf && ./install --all" })
		use({ "junegunn/fzf.vim", config = [[require("config.fzf")]] })
		use({ "lukas-reineke/indent-blankline.nvim", config = [[require("config.indent-blankline")]] })
		use({ "mcchrish/nnn.vim", config = [[require("config.nnn")]] })
		use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
		use({ "ms-jpq/coq_nvim", branch = "coq" })
		use({ "neovim/nvim-lspconfig", config = [[require("config.nvim-lspconfig")]] })
		use({ "neovimhaskell/haskell-vim", config = [[require("config.vim-haskell")]] })
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter/nvim-treesitter" })
		use({ "Shougo/vimproc.vim", run = "make" })
		use({ "sindrets/diffview.nvim", config = [[require("config.diffview")]] })
		use({ "tpope/vim-commentary", config = [[require("config.vim-commentary")]] })
		use({ "tpope/vim-fugitive", config = [[require("config.vim-fugitive")]] })
		use({ "w0rp/ale", config = [[require("config.ale")]] })
		use({ "dln/avro-vim" })

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
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = [[require("config.lualine")]],
		})

		use({
			"mzlogin/vim-markdown-toc",
			ft = { "markdown" },
		})
		use({
			"iamcco/markdown-preview.nvim",
			run = [[sh -c 'cd app && rm yarn.lock && yarn install']],
			ft = { "markdown" },
			config = [[require("config.markdown-preview")]],
		})

		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = [[require("config.nvim-tree")]],
		})

		use({
			"SmiteshP/nvim-gps",
			requires = { "nvim-treesitter/nvim-treesitter" },
			config = [[require("config.nvim-gps")]],
		})
	end,
	config = {
		profile = { enable = true },
		threshold = 1,
	},
})
