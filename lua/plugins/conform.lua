return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      rust = { "rustfmt" },
      go = { "gofmt" },
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
  },
}
