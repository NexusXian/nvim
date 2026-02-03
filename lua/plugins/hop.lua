-- lazy.nvim 插件配置
return {
  "smoka7/hop.nvim",     -- 推荐使用 active fork
  version = "*",
  opts = {
    keys = "etovxqpdygfblzhckisuran",  -- 自定义跳转键（可选）
  },
  config = function(_, opts)
    require("hop").setup(opts)
  end
}

