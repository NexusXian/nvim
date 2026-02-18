local preview_stack_trace_go = function()
  local line = vim.api.nvim_get_current_line()
  local filePath, lineNumber = line:match("(.+):(%d+)")
  if filePath and lineNumber then
    vim.cmd(":wincmd k")
    vim.cmd("e " .. filePath)
    vim.api.nvim_win_set_cursor(0, { tonumber(lineNumber), 0 })
    vim.cmd(":wincmd j")
  end

  print(filePath, lineNumber)
end

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  callback = function()
    vim.keymap.set("n", "<leader>gt", preview_stack_trace_go, { silent = true, noremap = true, buffer = true })
  end
})


local preview_stack_trace_flutter = function()
  local line = vim.api.nvim_get_current_line()

  -- 尝试匹配 file.dart:123:45 或 package:path/file.dart:123:45
  local filePath, lineNumber, columnNumber = line:match("([%w%p]+):(%d+):?(%d*)")

  if not filePath or not lineNumber then
    vim.notify("无法解析该行的文件路径或行号", vim.log.levels.WARN)
    return
  end

  lineNumber = tonumber(lineNumber)
  columnNumber = tonumber(columnNumber) or 0 -- 没有列号时默认0

  -- 获取当前窗口数量
  local wins = vim.api.nvim_list_wins()
  local cur_win = vim.api.nvim_get_current_win()
  local target_win = cur_win

  if #wins > 1 then
    -- 尝试切换到上方窗口打开文件
    for _, w in ipairs(wins) do
      if w ~= cur_win then
        target_win = w
        break
      end
    end
  end

  -- 打开文件
  vim.api.nvim_set_current_win(target_win)
  local ok, err = pcall(vim.cmd, "edit " .. vim.fn.fnameescape(filePath))
  if not ok then
    vim.notify("无法打开文件: " .. err, vim.log.levels.ERROR)
    return
  end

  -- 跳转到行列
  vim.api.nvim_win_set_cursor(0, { lineNumber, columnNumber })
end

-- 自动绑定 keymap
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "__FLUTTER__DEV__LOG__",
  callback = function()
    vim.keymap.set("n", "<leader>gf", preview_stack_trace_flutter, { silent = true, noremap = true, buffer = true })
  end
})

