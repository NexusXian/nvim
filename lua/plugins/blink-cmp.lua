return {
  'saghen/blink.cmp',
  build = 'cargo build --release',
  version = 'v0.*', -- 使用稳定的 v0 版本
  dependencies = {
    'rafamadriz/friendly-snippets',
    -- 如果你需要更好的图标支持，可以添加这个（可选）
    'onsails/lspkind.nvim',
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- -------------------------
    -- 1. 快捷键配置 (Keymaps)
    -- -------------------------
    fuzzy = { implementation = "prefer_rust" },
    keymap = {
      preset = 'none', -- 禁用预设，完全自定义以避免回车没反应
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
      ['<CR>'] = { 'accept', 'fallback' }, -- 回车确认补全

      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },

      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    },



    -- -------------------------
    -- 2. 补全列表美化 (UI)
    -- -------------------------
    completion = {
      -- 自动显示文档说明
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = 'rounded' }
      },

      -- 列表显示设置
      list = {
        selection = {
          preselect = true,  -- 默认选中第一项，解决回车没反应的问题
          auto_insert = true -- 输入时自动预览
        }
      },

      -- 菜单外观
      menu = {
        border = 'rounded',
        winblend = 0,
        draw = {
          columns = {
            { "kind_icon", "label",       gap = 1 },
            { "kind",      "source_name", gap = 1 }
          },
          components = {
            -- 自定义来源标签渲染
            source_name = {
              text = function(ctx)
                local names = { lsp = 'LSP', snippets = 'SNIP', buffer = 'BUF', path = 'PATH' }
                return "[" .. (names[ctx.source_id] or ctx.source_name) .. "]"
              end,
              highlight = 'BlinkCmpSource',
            },
          }
        }
      },

      -- 确认补全时自动添加括号
      accept = {
        auto_brackets = { enabled = true },
      },
    },

    -- -------------------------
    -- 3. 辅助功能
    -- -------------------------
    -- 函数签名帮助 (输入参数时的浮窗)
    signature = {
      enabled = true,
      window = { border = 'rounded' }
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    -- 补全来源列表
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },

  -- 允许其他插件扩展来源 (如 Copilot)
  opts_extend = { "sources.default" }
}
