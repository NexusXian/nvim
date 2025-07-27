-- 快捷函数
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local api = require("dropbar.api")

-- 在插入模式下将 jk 映射为 Esc
map('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- 在普通模式下映射 Ctrl + a 为全选操作
map('n', '<C-a>', function()
  vim.cmd('normal! ggVG')
end, { noremap = true, silent = true })

-- normal模式下使用大写的Y来共享剪切板
map('n', 'Y', '"+yy', { noremap = true, silent = true })

-- visual模式下使用大写的Y来共享剪切板
map('v', 'Y', '"+y', { noremap = true, silent = true })

local term_bufnr = nil
-- 在普通模式下映射 Ctrl + / 为开启终端
map('n', '<C-/>', function()
  -- 如果已有终端 buffer，并且窗口是可见的，关闭它
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if buf == term_bufnr then
      vim.api.nvim_win_close(win, true)
      return
    end
  end

  -- 否则创建一个新的终端窗口，大小为 10
  vim.cmd('belowright 10split | terminal')
  term_bufnr = vim.api.nvim_get_current_buf()
  vim.cmd('startinsert')
end, { noremap = true, silent = true })

-- 在终端模式中按 <Esc> 自动切回 normal 模式
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

-- 插件快捷键配置
-- nvim-tree 文件树
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer (nvim-tree)" })

-- BufferLine 标签页切换
map("n", "H", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "L", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- 窗口导航（方向键）
map("n", "<C-h>", "<C-w>h", opts) -- 向左切换窗口
map("n", "<C-j>", "<C-w>j", opts) -- 向下切换窗口
map("n", "<C-k>", "<C-w>k", opts) -- 向上切换窗口
map("n", "<C-l>", "<C-w>l", opts) -- 向右切换窗口

-- LSP 快捷键配置
-- 代码导航
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition" })
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Goto Declaration" })
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Goto Type Definition" })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Goto Implementation" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Find References" })

-- 代码提示与信息
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover Documentation" })
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature Documentation" })

-- 代码操作
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Action" })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename Symbol" })
map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "Format Code" })
map("n", "<leader>ai",
  "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })<CR>",
  { desc = "Organize Imports" })

-- 诊断错误
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous Diagnostic" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
map("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Open Diagnostics Location List" })
map("n", "<leader>dq", "<cmd>lua vim.diagnostic.setqflist()<CR>", { desc = "Open Diagnostics Quickfix List" })
map("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open Floating Diagnostic" })
-- LSP 格式化
map('n', '<leader>f', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'LSP: 格式化当前缓冲区' })

-- AI 辅助编程快捷键
map("n", "<leader>a", "<cmd>CodeCompanionChat<CR>", { desc = "Open Code Companion Chat" })

-- 文件管理器快捷键
map("n", "<leader>r", function()
  require("ranger-nvim").open(true)
end, {
  noremap = true,
  silent = true,
  desc = "打开文件管理器 (Ranger)",
})


--CompetiTest
map('n', '<leader>cr', ':CompetiTest run<CR>', {
  noremap = true,
  silent = true,
  desc = "运行测试"
})

map('n', '<leader>cp', ':CompetiTest receive problem<CR>', {
  noremap = true,
  silent = true,
  desc = "接收题目"
})

-- flutterTree
map('n', '<leader>fo', '<cmd>FlutterOutlineToggle<CR>', { desc = 'Toggle Flutter Outline' })

--nvim-dap
-- 基本调试控制
map("n", "<F5>", function() require("dap").continue() end,
  { desc = "DAP: 开始/继续调试" })
map("n", "<F10>", function() require("dap").step_over() end,
  { desc = "DAP: 单步跳过" })
map("n", "<F11>", function() require("dap").step_into() end,
  { desc = "DAP: 单步进入" })
map("n", "<F12>", function() require("dap").step_out() end,
  { desc = "DAP: 单步跳出" })
map("n", "<F6>", function() require("dap").terminate() end,
  { desc = "DAP: 终止调试会话" })
map("n", "<F9>", function() require("dap").restart() end,
  { desc = "DAP: 重启调试" })

-- 断点控制
map("n", "<leader>b", function() require("dap").toggle_breakpoint() end,
  { desc = "DAP: 切换断点" })
map("n", "<leader>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
  { desc = "DAP: 设置条件断点" })
map("n", "<leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
  { desc = "DAP: 设置日志点" })
map("n", "<leader>cb", function() require("dap").clear_breakpoints() end,
  { desc = "DAP: 清除所有断点" })

-- 调试 UI
map("n", "<leader>du", function() require("dapui").toggle() end,
  { desc = "DAP: 切换调试 UI" })
map("n", "<leader>dr", function() require("dap").repl.open() end,
  { desc = "DAP: 打开 REPL" })
map("n", "<leader>dl", function() require("dap").run_last() end,
  { desc = "DAP: 重新运行上次调试配置" })

-- 变量和状态查看
map({ "n", "v" }, "<leader>dh", function() require("dap.ui.widgets").hover() end,
  { desc = "DAP: 悬停查看变量" })
map({ "n", "v" }, "<leader>dp", function() require("dap.ui.widgets").preview() end,
  { desc = "DAP: 预览变量" })
map("n", "<leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end, { desc = "DAP: 查看调用栈" })
map("n", "<leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, { desc = "DAP: 查看作用域变量" })

-- dropbar
map('n', '<Leader>;', api.pick)
map('n', '[c', api.goto_context_start)
map('n', ']c', api.select_next_context)

