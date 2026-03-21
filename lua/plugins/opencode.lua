return {
  "NexusXian/opencode.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("opencode").setup({})  -- ← 必须在 config 函数里
  end,
}
