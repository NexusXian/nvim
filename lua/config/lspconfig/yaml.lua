local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

-- 配置 yaml 服务器
vim.lsp.config('yamlls', {
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
})

-- 启用 yaml 服务器（自动在 .yaml 等文件类型中激活）
vim.lsp.enable('yamlls')


