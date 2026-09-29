return {
  "tandy1229/deus.nvim",
  lazy = false,
  priority = 1000,

  config = function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("deus")
  end,
}
