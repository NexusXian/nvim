return {
  "SilverofLight/kd_translate.nvim",
  cmd = { "TranslateNormal", "TranslateVisual" },
  keys = {
    { "<leader>t", ":TranslateNormal<CR>", mode = "n", desc = "Translate" },
    { "<leader>t", ":TranslateVisual<CR>", mode = "v", desc = "Translate" },
  },
  config = function()
    require("kd").setup({
      window = {},
    })
  end,
}
