local coq = require("coq")
local lspconfig = require("lspconfig")
local vars = require("utils.vars")
local vim_api = vim.api

local on_attach = function(_, bufnr)
	vim_api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- Mappings.
	-- vars.remap.fn('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', vars.remap.opts)
	-- vars.remap.fn('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', vars.remap.opts)
	vars.remap.fn("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", vars.remap.opts)
end

local servers = {
	"dockerls",
	"html",
	"jsonls",
	"rnix",
	"solargraph",
	"terraformls",
	"tsserver",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		init_options = {
			usePlaceholders = true,
		},
	})
	lspconfig[lsp].setup(coq.lsp_ensure_capabilities())
end

vim_api.nvim_call_function("sign_define", {
	"LspDiagnosticsSignError",
	{
		text = "⤫",
		texthl = "LspDiagnosticsError",
	},
})

vim_api.nvim_call_function("sign_define", {
	"LspDiagnosticsSignWarning",
	{
		text = "⚠",
		texthl = "LspDiagnosticsSignWarning",
	},
})

vim_api.nvim_call_function("sign_define", {
	"LspDiagnosticsSignInformation",
	{
		text = "I",
		texthl = "LspDiagnosticsSignInformation",
	},
})

vim_api.nvim_call_function("sign_define", {
	"LspDiagnosticsSignHint",
	{
		text = "⚡",
		texthl = "LspDiagnosticsSignHint",
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = function(bufnr, client_id)
		local ok, result = pcall(vim_api.nvim_buf_get_var, bufnr, "show_signs")
		-- No buffer local variable set, so just enable by default
		if not ok then
			return true
		end
		return result
	end,
	underline = true,
	update_in_insert = false,
	virtual_text = false,
})

vim.cmd([[sign define LspDiagnosticsErrorSign text= texthl=LspDiagnosticsError linehl= numhl= ]])
vim.cmd([[autocmd CursorHold * lua require("lspsaga.diagnostic").show_line_diagnostics()]])
vim.cmd([[autocmd CursorHoldI * silent! lua require("lspsaga.signaturehelp").signature_help()]])
