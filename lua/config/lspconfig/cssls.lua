-- 配置 cssls 服务器（capabilities 已由 init.lua 的 '*' 全局注入）
vim.lsp.config('cssls', {
  settings = {
    css = { validate = true, lint = { unknownAtRules = 'ignore' } },  -- 忽略未知的 CSS at-rules
    scss = { validate = true },
    less = { validate = true },
  },
})

-- 启用 cssls 服务器（自动根据 .css/.scss/.less 等文件类型激活）
vim.lsp.enable('cssls')
