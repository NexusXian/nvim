return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters = {
      clang_format = {
        append_args = function(_, ctx)
          if vim.bo[ctx.buf].filetype ~= "cpp" then
            return {}
          end
          local config = vim.fs.find({ ".clang-format", "_clang-format" }, {
            path = vim.fs.dirname(ctx.filename),
            upward = true,
            type = "file",
          })
          if #config > 0 then
            return {}
          end
          return { "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}" }
        end,
      },
    },
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
