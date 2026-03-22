return {
  'windwp/nvim-ts-autotag',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    enable_close = true,         -- 自动补全结束标签
    enable_rename = true,        -- 改开始标签时同步改结束标签
    enable_close_on_slash = true,
  },
}
