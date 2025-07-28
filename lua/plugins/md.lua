return {
  "OXY2DEV/markview.nvim",
  ft = "markdown", -- 只在 Markdown 文件时加载
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    require("markview").setup()
  end,
}

