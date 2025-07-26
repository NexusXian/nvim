local lspconfig = require('lspconfig')
local lsp_common = require('config.lspconfig.init')

lspconfig.clangd.setup({
  capabilities = lsp_common.capabilities,
})
