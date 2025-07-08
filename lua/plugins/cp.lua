return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()
    require('competitest').setup({
      template_file = {
        cpp = "~/.config/nvim/templates/cp_template.cpp"
      }
    })
  end,
}
