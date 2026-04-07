return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" }, -- 推荐懒加载事件
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,        -- 自动补全 </tag>
        enable_rename = true,       -- 修改开始标签时同步结束标签
        enable_close_on_slash = false,
      },
    })
  end,
}
