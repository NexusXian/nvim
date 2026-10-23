local lsp_common = require('config.lspconfig.init')

vim.lsp.config('csharp_ls', {
  capabilities = lsp_common.capabilities,
})

vim.lsp.enable('csharp_ls')
