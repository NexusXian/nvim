return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    opts = {
      db_competion_shortcut = [[<C-p>]],
    },
    config = function()
      -- UI 配置
      vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui"
      vim.g.db_ui_show_help = 0
      vim.g.db_ui_win_width = 35
      vim.g.db_ui_force_echo_notifications = 1
    end,
    keys = {
      { "<leader>dtu", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
      { "<leader>dtf", "<cmd>DBUIFindBuffer<cr>", desc = "Find DB Buffer" },
    },
  },
}
