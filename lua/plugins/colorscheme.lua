return {
  "dracula/vim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme dracula")
    
    -- 可选配置
    vim.g.dracula_colorterm = 0
    vim.g.dracula_italic_comment = true
    vim.g.dracula_italic_keyword = true
    vim.g.dracula_italic_function = false
    vim.g.dracula_italic_variable = false
    
    -- 自定义高亮示例
    vim.api.nvim_set_hl(0, "Normal", { bg = "#282A36" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#343746" })
  end,
}
    
