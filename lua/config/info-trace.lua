local preview_stack_trace_go = function()
  local line = vim.api.nvim_get_current_line()

  -- 保存当前 terminal 窗口和光标位置
  local origin_win = vim.api.nvim_get_current_win()
  local origin_cursor = vim.api.nvim_win_get_cursor(origin_win)

  local patterns = {
    { "(/.-%.go):(%d+):(%d+)", true },
    { "(/.-%.go):(%d+)%s+%+0x%x+", false },
    { "(/.-%.go):(%d+)", false },
  }

  local filePath, lineNumber, colNumber

  for _, p in ipairs(patterns) do
    local path, lineNum, colNum = line:match(p[1])
    if path and lineNum then
      path = path:gsub("\27%[[0-9;]*m", "")
      path = path:gsub("%c", "")

      filePath = path
      lineNumber = tonumber(lineNum)
      colNumber = tonumber(colNum) or 1
      break
    end
  end

  if not filePath or not lineNumber then
    vim.notify("未识别 Go 错误行", vim.log.levels.WARN)
    return
  end

  if vim.fn.filereadable(filePath) == 0 then
    vim.notify("文件不存在: " .. filePath, vim.log.levels.ERROR)
    return
  end

  -- 切到上窗口
  vim.cmd("wincmd k")
  vim.cmd("edit " .. vim.fn.fnameescape(filePath))

  vim.schedule(function()
    if vim.api.nvim_buf_is_loaded(0) then
      local max_line = vim.api.nvim_buf_line_count(0)
      if lineNumber > max_line then
        lineNumber = max_line
      end

      vim.api.nvim_win_set_cursor(0, { lineNumber, colNumber - 1 })
      vim.cmd("normal! zz")
    end

    -- 回到原 terminal 窗口
    if vim.api.nvim_win_is_valid(origin_win) then
      vim.api.nvim_set_current_win(origin_win)

      -- 恢复原光标
      pcall(vim.api.nvim_win_set_cursor, origin_win, origin_cursor)
    end
  end)
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

