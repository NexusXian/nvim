return {
  'NexusXian/tsumugi.nvim',
  name = 'tsumugi',
  lazy = false, -- 启动时立即加载（作为主配色）
  priority = 1000, -- 最高优先级加载
  config = function()

    vim.cmd('colorscheme tsumugi')

  end,
}

