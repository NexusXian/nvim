local lspconfig = require('lspconfig')
local lsp_common = require('config.lspconfig.init')

lspconfig.lua_ls.setup({
  capabilities = lsp_common.capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
  on_attach = lsp_common.format_on_save,
})
