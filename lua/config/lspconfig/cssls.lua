local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

-- 配置 cssls（替代原 lspconfig.cssls.setup）
vim.lsp.config('cssls', {
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
  settings = {
    css = { validate = true, lint = { unknownAtRules = 'ignore' } },  -- 忽略未知的 CSS at-rules
    scss = { validate = true },
    less = { validate = true },
  },
})

-- 启用 cssls 服务器（自动根据 .css/.scss/.less 等文件类型激活）
vim.lsp.enable('cssls')
