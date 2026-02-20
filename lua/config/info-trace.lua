local preview_stack_trace_go = function()
  local line = vim.api.nvim_get_current_line()

  local patterns = {
    -- file:line:col
    { "(.+%.go):(%d+):(%d+)", true },

    -- file:line
    { "(.+%.go):(%d+)", false },

    -- panic stack: \t/path/file.go:12
    { "%s+(.+%.go):(%d+)", false },
  }

  local filePath, lineNumber

  for _, p in ipairs(patterns) do
    local path, line, col = line:match(p[1])
    if path and line then
      filePath = path
      lineNumber = tonumber(line)
      break
    end
  end

  if not filePath or not lineNumber then
    vim.notify("未识别 Go 错误行", vim.log.levels.WARN)
    return
  end

  -- 切到上窗口打开文件（符合你原来的设计）
  vim.cmd("wincmd k")
  vim.cmd("edit " .. vim.fn.fnameescape(filePath))
  vim.api.nvim_win_set_cursor(0, { lineNumber, 0 })
  vim.cmd("normal! zz")
  vim.cmd("wincmd j")

end

vim.keymap.set("n", "<leader>gt", preview_stack_trace_go, {
  silent = true,
  noremap = true,
  desc = "Go stacktrace preview",
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

