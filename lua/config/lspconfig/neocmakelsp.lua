-- 配置 neocmake 服务器（CMake LSP，lspconfig 名为 neocmake，mason 包名为 neocmakelsp）
vim.lsp.config('neocmake', {
  cmd = { "neocmakelsp", "stdio" },
})

-- 启用 neocmake 服务器（自动在 cmake 文件类型中激活）
vim.lsp.enable('neocmake')
