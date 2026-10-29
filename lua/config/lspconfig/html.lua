-- 配置 html 服务器（capabilities 已由 init.lua 的 '*' 全局注入）
vim.lsp.config('html', {})

-- 启用 html 服务器（自动在 .html 等文件类型中激活）
vim.lsp.enable('html')
