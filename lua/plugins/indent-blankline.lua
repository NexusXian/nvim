return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        use_treesitter = true,
        delay = 0,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = "╴",
        },
        style = {
          { fg = "#665775" },
          { fg = "#9b5961" },
        },
      },
      indent = {
        enable = true,                  -- 启用缩进线
        chars = { "┊" },
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
