local vim_g = vim.g
local vim_cmd = vim.cmd

local selectorPattern = ".*"
vim_g.firenvim_config = {
	localSettings = {
		[selectorPattern] = {
			selector = "textarea",
			priority = 0,
		},
	},
}

if vim_g.started_by_firenvim == 1 then
	vim_cmd([[
		setlocal laststatus=0
		setlocal noruler
		setlocal noshowcmd
	]])
end
