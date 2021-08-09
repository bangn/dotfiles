local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

local packer = require("packer")

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("arcticicestudio/nord-vim")
	use("christoomey/vim-tmux-navigator")
	use("fatih/vim-go")
	use("folke/zen-mode.nvim")
	use("glepnir/lspsaga.nvim")
	use("godlygeek/tabular")
	use("hrsh7th/nvim-compe")
	use("janko-m/vim-test")
	use("junegunn/fzf.vim")
	use("kabouzeid/nvim-lspinstall")
	use("ludovicchabant/vim-gutentags")
	use("lukas-reineke/indent-blankline.nvim")
	use("mcchrish/nnn.vim")
	use("michaeljsmith/vim-indent-object")
	use("mzlogin/vim-markdown-toc")
	use("neovim/nvim-lspconfig")
	use("neovimhaskell/haskell-vim")
	use("ntpeters/vim-better-whitespace")
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("sheerun/vim-polyglot")
	use("sindrets/diffview.nvim")
	use("tpope/vim-abolish")
	use("tpope/vim-bundler")
	use("tpope/vim-commentary")
	use("tpope/vim-endwise")
	use("tpope/vim-eunuch")
	use("tpope/vim-fugitive")
	use("tpope/vim-obsession")
	use("tpope/vim-repeat")
	use("tpope/vim-sleuth")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	use("vuki656/package-info.nvim")
	use("w0rp/ale")
	use("wellle/targets.vim")
	use("wsdjeg/vim-fetch")
	use({ "gelguy/wilder.nvim", requires = { "romgrk/fzy-lua-native" } })
	use({ "hrsh7th/vim-vsnip", requires = { "hrsh7th/vim-vsnip-integ" } })
	use({ "iamcco/markdown-preview.nvim", run = [[sh -c 'cd app && rm yarn.lock && yarn install']] })
	use({ "junegunn/fzf", run = "cd ~/.fzf && ./install --all" })
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "Shougo/vimproc.vim", run = "make" })
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
	})

	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	--------------------
	-- snippets
	--------------------
	use("andys8/vscode-jest-snippets")
	use("Chris56974/ruby-and-rails-snippets")
	use("karuna/vscode-rspec-snippets")
	use("leventebalogh/vscode-snippet-console-log")
	use("magicwhite/ruby-snippet")
	use("xabikos/vscode-javascript")
end)
