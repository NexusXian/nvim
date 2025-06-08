return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "c", "cpp", "go", "gomod", "lua", "html", "css", "javascript", "java", "dart", "python",
      "rust", "typescript", "tsx", "graphql", "vue", "yaml", "json", "markdown", "toml"
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- 为 Go 文件添加自动命令确保高亮启用
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        vim.cmd("TSBufEnable highlight")
      end,
    })
  end,
}
