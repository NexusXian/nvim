-- 配置 pyright 服务器（capabilities 已由 init.lua 的 '*' 全局注入）
vim.lsp.config('pyright', {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

-- 启用 pyright 服务器
vim.lsp.enable('pyright')
