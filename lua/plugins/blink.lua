return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "SergioRibera/cmp-dotenv",
    {
      "saghen/blink.compat",
      version = "2.*",
      lazy = false,
      opts = {},
    },
  },
  opts = {
    keymap = {
      preset = "none",
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-Space>"] = { "show" },
      ["<C-e>"] = { "hide" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        function(cmp)
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          local before_cursor = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col)

          if col ~= 0 and before_cursor:match("%s") == nil then
            cmp.show()
            return true
          end
        end,
        "fallback",
      },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    snippets = { preset = "luasnip" },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
    sources = {
      default = { "lsp", "snippets", "buffer", "path", "dotenv" },
      per_filetype = {
        renpy = { inherit_defaults = true, "renpy" },
      },
      providers = {
        lsp = { fallbacks = {} },
        dotenv = {
          name = "dotenv",
          module = "blink.compat.source",
          opts = {},
        },
        renpy = {
          name = "renpy",
          module = "blink.compat.source",
          opts = {},
        },
      },
    },
  },
}
