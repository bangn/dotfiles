local vim_g = vim.g
local vars = require("utils.vars")

vim_g.ale_linters = {
	sh = { "shellcheck" },
	ruby = { "rufo", "rubocop" },
	elixir = { "credo" },
	haskell = { "hlint" },
	lua = { "luacheck" },
	json = { "jsonlint", "jq" },
}
vim_g.ale_fixers = {
	["*"] = { "remove_trailing_lines", "trim_whitespace" },
	haskell = { "brittany", "floskell", "stylish-haskell" },
	html = { "prettier" },
	javascript = { "prettier", "eslint", "prettier-eslint" },
	javascriptreact = { "prettier", "eslint", "prettier-eslint" },
	json = { "prettier" },
	lua = { "stylua" },
	markdown = { "prettier" },
	nix = { "nixpkgs-fmt" },
	python = { "yapf" },
	ruby = { "rufo", "rubocop" },
	sh = { "shfmt" },
	sql = { "sqlformat" },
	typescript = { "prettier", "eslint" },
	typescriptreact = { "prettier", "eslint" },
	yaml = { "prettier" },
}

vim_g.ale_completion_enabled = 0
vim_g.ale_disable_lsp = 1
vim_g.ale_echo_msg_error_str = "E"
vim_g.ale_echo_msg_warning_str = "W"
vim_g.ale_echo_msg_format = "[%linter%][%code%] %s"
vim_g.ale_fix_on_save = 1
vim_g.ale_keep_list_window_open = 0 -- do not keep list if there is no error/warning
vim_g.ale_lint_on_enter = 0 -- don't want linters to run on opening a file
vim_g.ale_lint_on_save = 1
vim_g.ale_lint_on_text_changed = "never"
vim_g.ale_open_list = "on_save"
vim_g.ale_set_highlights = 1
vim_g.ale_set_loclist = 0
vim_g.ale_set_quickfix = 1
vim_g.ale_sh_shfmt_options = "-i 2 -ci"
vim_g.ale_sign_error = "⤫"
vim_g.ale_sign_warning = "⚠"
vim_g.jsx_ext_required = 0 -- Allow JSX in normal JS files
vim_g.javascript_plugin_flow = 1

-- sqlformat options
vim_g.ale_sql_sqlformat_options = "-r -k upper"
vars.remap.fn("n", "<leader>al", ":ALEToggle<CR>", {})
vars.remap.fn("n", "<leader>af", ":ALEFix<CR>", {})
