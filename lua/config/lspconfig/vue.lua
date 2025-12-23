local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

vim.lsp.config('vuels', {
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
})

vim.lsp.enable('vuels')
