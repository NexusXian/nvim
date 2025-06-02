local lspconfig = require('lspconfig')
local lsp_common = require('config.lspconfig.init') -- 引入公共配置

lspconfig.cssls.setup({
  capabilities = lsp_common.capabilities,
  settings = {
    css = { validate = true, lint = { unknownAtRules = 'ignore' } },
    scss = { validate = true },
    less = { validate = true },
  },
  on_attach = lsp_common.format_on_save,
})
