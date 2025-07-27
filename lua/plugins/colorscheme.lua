return {
  {
    "tandy1229/deus.nvim",
    lazy = false, -- 确保主题在启动时加载
    priority = 1000, -- 确保主题优先级最高
    config = function()
      vim.cmd([[colorscheme deus]])
    end,
  },
}
