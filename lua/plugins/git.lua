return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim", -- gitsigns 依赖
  },
  config = function()
    require("gitsigns").setup {
      signs = {
        add          = {hl = "GitGutterAdd",    text = "+", numhl = "GitGutterAddNr"},
        change       = {hl = "GitGutterChange", text = "~", numhl = "GitGutterChangeNr"},
        delete       = {hl = "GitGutterDelete", text = "_", numhl = "GitGutterDeleteNr"},
        topdelete    = {hl = "GitGutterDeleteChange", text = "‾", numhl = "GitGutterDeleteChangeNr"},
        changedelete = {hl = "GitGutterChange", text = "~", numhl = "GitGutterChangeNr"},
      },
      -- 下面是一些常见的可选配置
      signcolumn = false,  -- 是否显示在 signcolumn
      numhl =true,      -- 是否启用行号高亮
      linehl = false,     -- 是否启用整行高亮
      current_line_blame = true, -- 显示当前行的 git blame 信息
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 末尾显示
        delay = 200,
      },
      preview_config = {
        border = "single",
      },
      update_debounce = 100,
    }
  end
}

