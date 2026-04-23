return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,         -- 启用代码块高亮
        use_treesitter = true, -- 使用 treesitter 解析代码块
        delay = 0,
        chars = {              -- 代码块边框字符
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        style = {             -- 高亮样式
          { fg = "#806d9c" }, -- 正常代码块颜色
          { fg = "#c21f30" }, -- 错误代码块颜色（如未闭合）
        },
      },
      indent = {
        enable = true,                  -- 启用缩进线
        chars = { "│", "¦", "┆", "┊", },
        style = { { fg = "#444444" } }, -- 缩进线颜色
      },
      line_num = {
        enable = false, -- 启用行号高亮
      },
      blank = {
        use_treesitter = true,
        enable = false, -- 禁用空白符显示（可选启用）
      },
    })
  end
}



