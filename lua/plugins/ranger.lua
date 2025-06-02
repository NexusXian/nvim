return {
  "kelly-lin/ranger.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- 确保依赖被加载
  config = function()
    require("ranger-nvim").setup({ replace_netrw = true })
  end,
}
