return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
      check_ts = true,               -- 启用 Tree-sitter 语法感知
      ts_config = {
        lua = { "string", "source" }, -- 在 Lua 中跳过这些语法节点
        javascript = { "string", "template_string" },
        java = false,                -- 在 Java 中禁用
      },
      disable_filetype = { "TelescopePrompt", "vim" }, -- 在这些文件类型中禁用
      fast_wrap = {
        map = '<C-w>',               -- 快速环绕映射 (Meta+e)
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
      },
    },
    config = function(_, opts)
      local autopairs = require('nvim-autopairs')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      
      autopairs.setup(opts)
      
      -- 与 nvim-cmp 集成
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done({
          map_char = {
            tex = '' -- 在 TeX 文件中禁用
          }
        })
      )
    end,
  },
}
