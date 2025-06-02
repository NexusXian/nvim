return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",       -- 可选：懒加载
    event = "InsertEnter", -- 在插入模式时加载
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = false,
          auto_trigger = true,
          debounce = 75,
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = true,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js 解释器路径
        server_opts_overrides = {},
      })
    end,
  },
}
