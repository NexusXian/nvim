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
      lsp_cfg = true,
      lsp_on_attach = true,
      dap_debug = false, -- 明确禁用调试
      trouble = false,
    })
  end,
  build = ':lua require("go.install").update_all_sync()',
}
