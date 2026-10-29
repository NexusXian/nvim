-- rust_analyzer：clippy 保存检查 + rustfmt（格式化由手动触发）
vim.lsp.config('rust_analyzer', {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        enable = true,
        command = "clippy"  -- 保存时用 clippy 进行严格检查（需安装：rustup component add clippy）
      },
      rustfmt = {
        enable = true  -- rustfmt 作为 LSP 格式化提供者（手动调用）
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
