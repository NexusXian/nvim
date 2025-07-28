return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│", -- 缩进线字符
      tab_char = "│", -- Tab字符的缩进线
    },
    scope = {
      enabled = true,                            -- 启用范围高亮
      show_start = true,                         -- 显示范围起始位置
      show_end = true,                           -- 显示范围结束位置
      highlight = { "Function", "Label" },       -- 高亮组
    },
    whitespace = {
      remove_blankline_trail = true,       -- 移除空行末尾的缩进线
    },
    exclude = {
      filetypes = {       -- 排除的文件类型
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
}
