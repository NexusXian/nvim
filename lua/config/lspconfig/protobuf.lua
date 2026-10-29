-- 配置 proto 服务器（capabilities 已由 init.lua 的 '*' 全局注入）
vim.lsp.config('buf_ls', {})

-- 启用 buf_ls 服务器（自动在 .proto 等文件类型中激活）
vim.lsp.enable('buf_ls')
