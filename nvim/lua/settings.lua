local set = vim.o
local vim_cmd = vim.cmd
local vim_g = vim.g
local home = os.getenv("HOME")

vim_cmd("au TermOpen * setlocal nonumber norelativenumber")
vim_cmd([[filetype plugin indent on]])
vim_cmd([[set iskeyword+=-]])

vim_g.python3_host_prog = "/usr/bin/python3"

set.autoread = true
set.backspace = "indent,eol,start"
set.backup = false
set.clipboard = "unnamedplus"
set.colorcolumn = "80"
set.conceallevel = 0
set.cursorcolumn = true
set.dir = home .. "/swap"
set.encoding = "UTF-8"
set.expandtab = true
set.foldenable = false
set.foldmethod = "indent"
set.foldnestmax = 10
set.ignorecase = true
set.incsearch = true
set.linebreak = true
set.list = true
set.listchars = "tab:▷⋅,trail:⋅,nbsp:⋅"
set.mouse = "a"
set.number = true
set.ruler = true
set.scrolloff = 3
set.shiftwidth = 2
set.signcolumn = "yes:1"
set.smartcase = true
set.smarttab = true
set.softtabstop = 4
set.splitbelow = true
set.splitright = false
set.synmaxcol = 120
set.tabstop = 4
set.textwidth = 80
set.ttyfast = true
set.undodir = home .. "/undo"
set.undofile = true
set.undolevels = 1000
set.undoreload = 10000
set.updatetime = 300
set.wrap = false
