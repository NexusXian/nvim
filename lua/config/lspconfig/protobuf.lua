local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

-- 配置 proto 服务器
vim.lsp.config('buf_ls', {
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
})

-- 启用 proto 服务器（自动在 .proto 等文件类型中激活）
vim.lsp.enable('buf_ls')


