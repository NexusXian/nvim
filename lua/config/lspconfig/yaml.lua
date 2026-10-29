-- 配置 yamlls 服务器（capabilities 已由 init.lua 的 '*' 全局注入）
vim.lsp.config('yamlls', {})

-- 启用 yamlls 服务器（自动在 .yaml 等文件类型中激活）
vim.lsp.enable('yamlls')
