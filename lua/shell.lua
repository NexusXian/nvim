local float_term = nil

-- 创建或切换浮动终端
local function toggle_float_term()
  if float_term == nil then
    -- 创建浮动窗口
    float_term = vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), true, {
      relative = "editor",
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.8),
      row = math.floor(vim.o.lines * 0.1),
      col = math.floor(vim.o.columns * 0.1),
      style = "minimal",
    })

    -- 设置终端模式，并运行命令
    local term_buf = vim.api.nvim_win_get_buf(float_term)
    vim.fn.termopen("go run main.go", { on_exit = function()
      vim.api.nvim_buf_delete(term_buf, { force = true })
      float_term = nil
    end })
    vim.cmd("startinsert") -- 自动进入插入模式
  else
    -- 关闭浮动终端
    vim.api.nvim_win_close(float_term, true)
    float_term = nil
  end
end

-- 绑定快捷键 r
vim.keymap.set("n", "r", toggle_float_term, { noremap = true, silent = true })

