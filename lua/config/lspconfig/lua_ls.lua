local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

-- 配置 lua_ls 服务器
vim.lsp.config('lua_ls', {
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },  -- 识别 vim 全局变量，避免报错
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),  -- 包含 Neovim 运行时文件作为库
        checkThirdParty = false,  -- 禁用第三方库检查（避免提示安装 Lua 环境）
      },
    },
  },
})

-- 启用 lua_ls 服务器（自动在 .lua 文件中激活）
vim.lsp.enable('lua_ls')
