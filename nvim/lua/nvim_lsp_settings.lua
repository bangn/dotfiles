local nvim_lsp = require('nvim_lsp')

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require'diagnostic'.on_attach()
  require'completion'.on_attach()

  -- Mappings.
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<C-]>'      , '<cmd>lua vim.lsp.buf.definition()<CR>'             , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>e'  , '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>' , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , 'gD'         , '<cmd>lua vim.lsp.buf.declaration()<CR>'            , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , 'gi'         , '<cmd>lua vim.lsp.buf.implementation()<CR>'         , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , 'gr'         , '<cmd>lua vim.lsp.buf.references()<CR>'             , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , 'gt'         , '<cmd>lua vim.lsp.buf.type_definition()<CR>'        , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , 'K'          , '<cmd>lua vim.lsp.buf.hover()<CR>'                  , opts)
end

local servers = {
  'jsonls',
  'rnix',
  'solargraph',
  'tsserver',
  'yamlls',
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
  }
end

nvim_lsp.yamlls.setup {
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
