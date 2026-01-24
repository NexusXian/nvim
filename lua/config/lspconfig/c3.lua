local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

vim.lsp.config('c3-lsp', {
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
})

vim.lsp.enable('c3-lsp')
