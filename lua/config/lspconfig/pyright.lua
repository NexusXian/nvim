local lsp_common = require('config.lspconfig.init') -- 保留通用配置引用

-- 配置 pyright 服务器
vim.lsp.config('pyright', {
  capabilities = lsp_common.capabilities,

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
