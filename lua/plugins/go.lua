return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua", -- 浮窗依赖，必须
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "go", "gomod" },
  config = function()
    require("go").setup({
      lsp_cfg = false,       -- 禁用，因为您已手动配置 gopls
      lsp_on_attach = false, -- 禁用，避免与您的配置冲突
      dap_debug = false,     -- 明确禁用调试
      trouble = false,

      -- 格式化设置
      gofmt = 'gofumpt',     -- 使用 gofumpt 而不是 gofmt
      goimports = 'gofumpt', -- 使用 gofumpt 进行导入整理

      -- 自动格式化
      fmt_on_save = true, -- 保存时自动格式化

      -- 其他工具设置
      fillstruct = 'gopls', -- 使用 gopls 填充结构体
      dap_debug_vt = false, -- 禁用调试虚拟文本
    })

    -- 为 Go 文件设置制表符选项
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        vim.opt_local.expandtab = true -- 将制表符转换为空格
        vim.opt_local.tabstop = 2      -- 制表符显示为 4 个空格
        vim.opt_local.shiftwidth = 2   -- 缩进使用 4 个空格
        vim.opt_local.softtabstop = 2  -- 软制表符为 4 个空格
      end,
    })
  end,
  build = ':lua require("go.install").update_all_sync()',
}
