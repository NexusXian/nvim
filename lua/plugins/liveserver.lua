return {
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server", -- 确保自动全局安装 live-server
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },
}
