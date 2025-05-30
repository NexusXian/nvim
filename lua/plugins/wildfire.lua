return {
  {
    "gcmt/wildfire.vim",
    event = "VeryLazy",
    init = function()
      -- 可选：自定义文本对象类型（默认已经包括 'i)', 'i]', '}' 等）
      vim.g.wildfire_objects = {
        "i'",
        'i"',
        "i)",
        "i]",
        "i}",
        "ip",
        "it",
      }
    end,
  },
}
