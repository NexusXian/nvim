local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

-- 配置 pyright 服务器
vim.lsp.config('pyright', {
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
})

-- 启用 pyright 服务器（自动在 .py 文件中激活）
vim.lsp.enable('pyright')
