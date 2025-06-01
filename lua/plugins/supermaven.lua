return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-CR>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        color = {
          suggestion_color = "#A89984",
          cterm = 244,
        },
        log_level = "info",                -- 设置为 "off" 可禁用日志
        disable_inline_completion = false, -- 启用 inline 补全（用于非 cmp 用户）
        disable_keymaps = false,           -- 使用内置快捷键
        condition = function()
          return false
        end, -- 当返回 true 时将停止 supermaven 插件
      })
    end,
  },
}
