return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- 图标支持
    },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- 你也可以用 "tabs"
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          show_buffer_close_icons = true,
          show_close_icon = false,
          separator_style = "thin", -- 可选："slant", "thick", "thin", { 'left', 'right' }
        },
      })
    end,
  },
}

