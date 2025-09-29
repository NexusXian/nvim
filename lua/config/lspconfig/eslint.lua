local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

-- 配置 eslint 服务器
vim.lsp.config('eslint', {
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
  on_attach = function(client, bufnr)
    -- 保留原有自动修复逻辑：保存前执行 ESLint 修复
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',  -- 保存时自动修复可修复的 ESLint 问题
    })
  end,
})

-- 启用 eslint 服务器（自动在 JS/TS 等文件类型中激活）
vim.lsp.enable('eslint')
