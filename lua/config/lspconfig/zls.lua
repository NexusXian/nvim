local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

-- configure zig server  
vim.lsp.config('zls', {
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
})

-- start zig server
vim.lsp.enable('zls')
