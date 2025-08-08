local lspconfig = require('lspconfig')
local lsp_common = require('config.lspconfig.init')

lspconfig.pyright.setup({
  capabilities = lsp_common.capabilities,
})
