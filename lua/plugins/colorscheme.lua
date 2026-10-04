return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,

  config = function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("nordfox")
  end,
}
