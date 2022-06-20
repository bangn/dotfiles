local vim_wo = vim.wo

vim_wo.foldcolumn = "1"
vim_wo.foldlevel = 6
vim_wo.foldenable = true

local ftMap = {
	vim = "indent",
	git = "",
}

require("ufo").setup({
	provider_selector = function(bufnr, filetype)
		-- return a string type use internal providers
		-- return a string in a table like a string type
		-- return empty string '' will disable any providers
		-- return `nil` will use default value {'lsp', 'indent'}
		return ftMap[filetype]
	end,
})
