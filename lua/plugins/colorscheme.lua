return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- 优先加载主题
    config = function()
      require("catppuccin").setup({
        flavour = "frappe", -- 可选: latte, frappe, macchiato, mocha
        transparent_background = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          lsp_trouble = true,
          mason = true,
          neotree = true,
          notify = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          which_key = true,
          indent_blankline = {
            enabled = true,
            scope_color = "lavender", -- 可以设为 `lavender` 或其他
            colored_indent_levels = false,
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
