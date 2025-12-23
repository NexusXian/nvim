local lsp_common = require('config.lspconfig.init')

vim.lsp.config('ts_ls', {
  capabilities = lsp_common.capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

vim.lsp.enable('ts_ls')

