local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<C-]>'    , '<cmd>lua vim.lsp.buf.definition()<CR>'            , opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', 'gD'       , '<cmd>lua vim.lsp.buf.declaration()<CR>'           , opts)
  buf_set_keymap('n', 'gi'       , '<cmd>lua vim.lsp.buf.implementation()<CR>'        , opts)
  buf_set_keymap('n', 'gr'       , '<cmd>lua vim.lsp.buf.references()<CR>'            , opts)
  buf_set_keymap('n', 'gt'       , '<cmd>lua vim.lsp.buf.type_definition()<CR>'       , opts)
  buf_set_keymap('n', 'K'        , '<cmd>lua vim.lsp.buf.hover()<CR>'                 , opts)
end

local servers = {
  'jsonls',
  'rnix',
  'solargraph',
  'terraformls',
  'tsserver',
  'yamlls',
  'html',
  'dockerls',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      customTags = {
        -- AWS CFN template
        "!Equals scalar",
        "!GetAtt scalar",
        "!Join scalar",
        "!Or scalar",
        "!Ref scalar",
        "!Sub scalar",
      },
      format = {
        enable = true,
        proseWrape = "always",
        prrintWith = 120,
      },
    }
  }
}
