return {
  'tomtom/tcomment_vim',
  lazy = false,
  config = function()
    vim.g.tcomment_maps = 1          -- 启用默认映射
    vim.g.tcomment_preserve_cursor = 1 -- 保留光标位置
  end,
}
