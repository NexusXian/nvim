lspconfig.tsserver.setup({
  capabilities = lsp_common.capabilities,
  on_attach = lsp_common.format_on_save,
})
