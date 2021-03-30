vim.api.nvim_call_function('sign_define',
  {
    'LspDiagnosticsSignError',
    {
      text = '⤫',
      texthl = 'LspDiagnosticsError'
    }
  }
)

vim.api.nvim_call_function('sign_define',
  {
    'LspDiagnosticsSignWarning',
    {
      text = '⚠',
      texthl = 'LspDiagnosticsSignWarning'
    }
  }
)

vim.api.nvim_call_function('sign_define',
  {
    'LspDiagnosticsSignInformation',
    {
      text = 'I',
      texthl = 'LspDiagnosticsSignInformation'
    }
  }
)

vim.api.nvim_call_function('sign_define',
  {
    'LspDiagnosticsSignHint',
    {
      text = '⚡',
      texthl = 'LspDiagnosticsSignHint'
    }
  }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end
      return result
    end,
    underline = true,
    update_in_insert = false,
    virtual_text = false,
  }
)
vim.cmd [[ sign define LspDiagnosticsErrorSign text= texthl=LspDiagnosticsError linehl= numhl= ]]
vim.cmd [[autocmd CursorHold * lua require("lspsaga.diagnostic").show_line_diagnostics()]]
vim.cmd [[autocmd CursorHoldI * silent! lua require("lspsaga.signaturehelp").signature_help()]]
