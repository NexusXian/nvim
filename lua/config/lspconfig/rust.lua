local lspconfig = require('lspconfig')
local lsp_common = require('config.lspconfig.init')

lspconfig.rust_analyzer.setup({
  on_attach = lsp_common.on_attach,  -- 从通用配置中获取 on_attach
  capabilities = lsp_common.capabilities,  -- 从通用配置中获取 capabilities
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        enable = true,
        command = "clippy"  -- 保存时用 clippy 检查（需确保 clippy 已安装：rustup component add clippy）
      },
      rustfmt = {
        enable = true  -- 启用 rustfmt 格式化支持
      },
      cargo = {
        allFeatures = true  -- 启用所有 Cargo 特性
      },
      completion = {
        autoimport = {
          enable = true  -- 自动导入缺失的类型/模块
        }
      },
    }
  }
})
