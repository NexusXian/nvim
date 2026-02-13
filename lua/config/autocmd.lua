-- 创建一个自动命令组
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

-- nvim .的时候，如果只有一个参数，就打开Telescope find_files
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 1 and vim.fn.argv(0) == "." then
      vim.cmd("Telescope find_files")
    end
  end,
})

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



