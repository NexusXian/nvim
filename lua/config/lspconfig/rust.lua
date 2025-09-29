local lsp_common = require('config.lspconfig.init')  -- 保留通用配置引用

vim.lsp.config('rust_analyzer', {
  on_attach = lsp_common.on_attach,  -- 复用通用 on_attach（如快捷键、格式化）
  capabilities = lsp_common.capabilities,  -- 复用通用补全能力
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        enable = true,
        command = "clippy"  -- 保存时用 clippy 进行严格检查（需安装：rustup component add clippy）
      },
      rustfmt = {
        enable = true  -- 启用 rustfmt 自动格式化
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

-- 启用 rust_analyzer（自动在 .rs 文件中激活）
vim.lsp.enable('rust_analyzer')
