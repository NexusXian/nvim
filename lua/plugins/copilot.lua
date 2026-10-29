return {
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    event = "VeryLazy",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-l>",      -- 接受建议
            accept_word = "<C-j>", -- 接受单词建议
            dismiss = "<C-]>",     -- 清除建议
          },
        },
        ft_func = require("copilot.suggestion").smart_tab_ft_func,
        log_level = "info", -- 设置为 "off" 可禁用日志
      })

      vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#8F8A83", ctermfg = 244 })
    end,
  },
}
