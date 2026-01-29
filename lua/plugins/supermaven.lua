return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      -- 在 init.lua 中加载 supermaven 插件
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-CR>", -- 添加接受建议的快捷键
          clear_suggestion = "<C-]>",   -- 添加清除建议的快捷键
          accept_word = "<C-j>",        --# 添加接受单词建议的快捷键
          accept_line = "<C-l>",        -- 添加接受单行建议的快捷键
        },
        color = {
          suggestion_color = "#8F8A83",
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
