-- 创建一个自动命令组（可选，但推荐）
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

-- 创建自动命令
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual", -- 高亮组，比如 "IncSearch", "Visual", "Search" 等
      timeout = 300       -- 高亮持续时间（毫秒）
    })
  end,
})
