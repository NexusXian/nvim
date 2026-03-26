local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

-- 配置 json 服务器
vim.lsp.config('jsonls', {
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
})

-- 启用 json 服务器（自动在 .json 等文件类型中激活）
vim.lsp.enable('jsonls')

