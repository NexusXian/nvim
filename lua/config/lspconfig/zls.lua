-- configure zig server（capabilities 已由 init.lua 的 '*' 全局注入）
vim.lsp.config('zls', {})

-- start zig server
vim.lsp.enable('zls')
