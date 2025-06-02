local lspconfig = require('lspconfig')
local lsp_common = require('config.lspconfig.init')

lspconfig.gopls.setup({
  capabilities = lsp_common.capabilities,
  on_attach = lsp_common.format_on_save,
})
