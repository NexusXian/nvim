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

      -- 格式化设置（修正：注释说明和工具名对应）
      gofmt = 'gofmt',       -- 使用 gofmt 作为格式化工具
      goimports = 'goimports', -- 用 goimports 整理导入（而非 gofmt）
      lsp_fmt_async = true,  -- 异步格式化，提升体验

      -- 自动格式化
      fmt_on_save = true, -- 保存时自动格式化

      -- 其他工具设置
      fillstruct = 'gopls', -- 使用 gopls 填充结构体
      dap_debug_vt = false, -- 禁用调试虚拟文本
    })

    -- 为 Go 文件设置制表符选项（修正为 4 个空格）
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        vim.opt_local.expandtab = true -- 将制表符转换为空格（Go 推荐）
        vim.opt_local.tabstop = 4      -- 制表符显示为 4 个空格
        vim.opt_local.shiftwidth = 4   -- 缩进使用 4 个空格
        vim.opt_local.softtabstop = 4  -- 软制表符为 4 个空格
        vim.opt_local.smartindent = true -- 智能缩进（Go 适配）
      end,
    })

    -- 关键：强制 gofmt 使用 4 空格缩进（覆盖默认配置）
    vim.g.go_fmt_options = {
      gofmt = '-tabs=false -tabwidth=4', -- gofmt 禁用制表符，用 4 空格
    }
  end,
  build = ':lua require("go.install").update_all_sync()',
}
