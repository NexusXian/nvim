require('nvim-treesitter.configs').setup {
  ensure_installed = "all", -- 或者指定语言列表 {"lua", "python", "javascript"}
  highlight = {
    enable = true, -- 开启语法高亮
  },
  rainbow = {
    enable = true, -- 启用彩虹括号
    extended_mode = true, -- 对括号以外的符号也应用（如 HTML 标签）
    max_file_lines = 1000, -- 文件行数限制，防止大文件卡顿
    colors = {
      "#ff5555", -- 红
      "#f1fa8c", -- 黄
      "#50fa7b", -- 绿
      "#8be9fd", -- 蓝
      "#bd93f9", -- 紫
      "#ff79c6", -- 粉
      "#9aedfe"  -- 浅蓝
    },
    termcolors = { "Red", "Yellow", "Green", "Blue", "Magenta", "Cyan", "White" },
  }
}

