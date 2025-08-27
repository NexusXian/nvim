local lspconfig = require('lspconfig')
local lsp_common = require('config.lspconfig.init')

lspconfig.clangd.setup({
  capabilities = lsp_common.capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--all-scopes-completion",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=never",
    -- 可以根据需要添加其他clangd参数
  },
  init_options = {
    fallbackFlags = { "-std=c++23" }  -- 这里是关键修正
  }
})
