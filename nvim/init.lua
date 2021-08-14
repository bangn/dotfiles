local vim_g = vim.g
local vim_cmd = vim.cmd

vim_g.mapleader = ","

require("settings")

require("mappings")
require("plugins")
require("plugins.ale")
require("plugins.diffview")
require("plugins.firenvim")
require("plugins.fzf")
require("plugins.gitsigns")
require("plugins.indent-blankline")
require("plugins.lualine")
require("plugins.markdown-preview")
require("plugins.nnn")
require("plugins.nord-vim")
require("plugins.nvim-compe")
require("plugins.nvim-lspconfig")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.vim-commentary")
require("plugins.vim-fugitive")
require("plugins.vim-go")
require("plugins.vim-haskell")
require("plugins.vim-polyglot")
require("plugins.vim-snip")
require("plugins.vim-terraform")
require("plugins.vim-test")
require("plugins.zen-mode")
