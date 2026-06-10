return {
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
    ft = "html",
    init = function()
      vim.g.live_server = {
        port = 8200,
        browser = "default",
      }
    end,
    keys = {
      {
        "<leader>ls",
        "<cmd>LiveServerToggle<CR>",
        desc = "Toggle Live Server",
      },
    },
  },
}
