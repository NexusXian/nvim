return {
  "3rd/image.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("image").setup({
      backend = "kitty", -- 如果你是 wezterm 改成 "wezterm"
      integrations = {
        markdown = {
          enabled = true,
          only_render_image_at_cursor = false, -- true：光标处才显示
        },
      },
    })
  end,
}

