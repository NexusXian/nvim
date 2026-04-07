return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local ts = require("nvim-treesitter")

      -- 初始化（可选）
      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- 安装 parser（异步）
      ts.install({
        ts.install({
          "html",
          "css",
          "scss",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "vue",

          "go",
          "gomod",
          "gosum",
          "gowork",
          "rust",
          "java",
          "python",

          "proto", -- gRPC
          "sql", -- SQL
          "graphql", -- API

          "dart",

          "bash",
          "dockerfile",
          "yaml",
          "toml",

          "markdown",
          "markdown_inline",

          "lua",
          "vim",
          "vimdoc",

          "c",
          "cpp",
        })
      })

      -- 自动启用 treesitter
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)

          -- 启动高亮
          pcall(vim.treesitter.start, args.buf, lang)
        end,
      })

      -- 折叠
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.opt.foldlevel = 99
    end,
  },
}
