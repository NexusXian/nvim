return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    -- 使用 opts 会自动调用 require('nvim-autopairs').setup(opts)
    opts = {
      check_ts = true,               -- 启用 Tree-sitter 语法感知
      ts_config = {
        lua = { "string", "source" }, -- 在 Lua 中跳过这些语法节点
        javascript = { "string", "template_string" },
        java = false,                -- 在 Java 中禁用
      },
      disable_filetype = { "TelescopePrompt", "vim" }, -- 在这些文件类型中禁用
      fast_wrap = {
        map = '<C-w>',               -- 快速环绕映射
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
      },
    },
    -- 移除了包含 require('cmp') 的 config 函数
  },
}
