local lsp_common = require('config.lspconfig.init')

-- 配置 clangd（替代原 lspconfig.clangd.setup）
vim.lsp.config('clangd', {
  capabilities = lsp_common.capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--all-scopes-completion",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=never",
  },
  init_options = {
    fallbackFlags = { "-std=c++23" }  -- 指定 C++23 标准
  }
})

vim.lsp.enable('clangd')
