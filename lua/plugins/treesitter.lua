return {
  "nvim-treesitter/nvim-treesitter",
  -- 强制在启动时加载，确保高亮立即生效
  lazy = false,
  -- 每次插件更新后自动更新解析器
  build = ":TSUpdate",
  -- 将所有配置写在 opts 中
  opts = {
    ensure_installed = {
      "c", "cpp", "go", "gomod", "lua", "html", "css", "javascript",
      "java", "dart", "python", "rust", "typescript", "tsx",
      "graphql", "vue", "yaml", "json", "markdown", "toml", "zig",
      "vim", "vimdoc", "query" -- 建议加上这些基础解析器
    },
    -- 开启自动安装缺失解析器的功能
    auto_install = true,
    -- 语法高亮
    highlight = {
      enable = true,
      -- 如果你觉得某些语言自带的高亮更好，可以设为 true，通常设为 false 即可
      additional_vim_regex_highlighting = false,
    },
    -- 自动缩进
    indent = { enable = true },
  },
  -- 注意：这里删除了原来的 config 函数，lazy.nvim 会自动处理
}
