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
      -- 其他 go.nvim 功能仍然可用，如：
      -- goimports, gofmt, gotests 等工具集成
    })
  end,
  build = ':lua require("go.install").update_all_sync()',
}
