-- 配置 jsonls 服务器（capabilities 已由 init.lua 的 '*' 全局注入）
vim.lsp.config('jsonls', {})

-- 启用 jsonls 服务器（自动在 .json 等文件类型中激活）
vim.lsp.enable('jsonls')
