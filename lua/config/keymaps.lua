-- Shortcut functions
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local api = require("dropbar.api")

-- Map 'jk' to Esc in insert mode
map('i', 'jk', '<Esc>', { noremap = true, silent = true, desc = "Exit insert mode" })

-- Map Ctrl + a to select all in normal mode
map('n', '<C-a>', function()
  vim.cmd('normal! ggVG')
end, { noremap = true, silent = true, desc = "Select all text" })

-- Use uppercase Y to copy to system clipboard in normal mode
map('n', 'Y', '"+yy', { noremap = true, silent = true, desc = "Yank line to system clipboard" })

-- Use uppercase Y to copy to system clipboard in visual mode
map('v', 'Y', '"+y', { noremap = true, silent = true, desc = "Yank selection to system clipboard" })

local term_bufnr = nil
-- Map Ctrl + / to toggle terminal in normal mode
map('n', '<C-/>', function()
  -- If terminal buffer exists and is visible, close it
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if buf == term_bufnr then
      vim.api.nvim_win_close(win, true)
      return
    end
  end

  -- Otherwise create a new terminal window with size 10
  vim.cmd('belowright 10split | terminal')
  term_bufnr = vim.api.nvim_get_current_buf()
  vim.cmd('startinsert')
end, { noremap = true, silent = true, desc = "Toggle terminal" })

-- Map <Esc> to exit terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, desc = "Exit terminal mode" })

-- Plugin key mappings
-- nvim-tree file explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer (nvim-tree)" })

-- BufferLine tab navigation
map("n", "H", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "L", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- Window navigation with Ctrl + arrow keys
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Navigate left window" })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Navigate down window" })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Navigate up window" })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Navigate right window" })

-- LSP key mappings
-- Code navigation
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition" })
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Goto Declaration" })
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Goto Type Definition" })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Goto Implementation" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Find References" })

-- Code hints and information
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover Documentation" })
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature Documentation" })

-- Code actions
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Action" })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename Symbol" })
map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "Format Code" })
map("n", "<leader>ai",
  "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })<CR>",
  { desc = "Organize Imports" })

-- Diagnostic errors
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous Diagnostic" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
map("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Open Diagnostics Location List" })
map("n", "<leader>dq", "<cmd>lua vim.diagnostic.setqflist()<CR>", { desc = "Open Diagnostics Quickfix List" })
map("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open Floating Diagnostic" })

-- AI coding assistant
map("n", "<leader>a", "<cmd>CodeCompanionChat<CR>", { desc = "Open Code Companion Chat" })

-- File manager
map("n", "<leader>r", function()
  require("ranger-nvim").open(true)
end, {
  noremap = true,
  silent = true,
  desc = "Open file manager (Ranger)",
})

-- CompetiTest
map('n', '<leader>cr', ':CompetiTest run<CR>', {
  noremap = true,
  silent = true,
  desc = "Run test cases"
})

map('n', '<leader>cp', ':CompetiTest receive problem<CR>', {
  noremap = true,
  silent = true,
  desc = "Receive problem"
})

-- FlutterTree
map('n', '<leader>fo', '<cmd>FlutterOutlineToggle<CR>', { desc = 'Toggle Flutter Outline' })

-- nvim-dap debugging
-- Basic debugging control
map("n", "<F5>", function() require("dap").continue() end,
  { desc = "DAP: Start/continue debugging" })
map("n", "<F10>", function() require("dap").step_over() end,
  { desc = "DAP: Step over" })
map("n", "<F11>", function() require("dap").step_into() end,
  { desc = "DAP: Step into" })
map("n", "<F12>", function() require("dap").step_out() end,
  { desc = "DAP: Step out" })
map("n", "<F6>", function() require("dap").terminate() end,
  { desc = "DAP: Terminate debugging session" })
map("n", "<F9>", function() require("dap").restart() end,
  { desc = "DAP: Restart debugging" })

-- Breakpoint control
map("n", "<leader>b", function() require("dap").toggle_breakpoint() end,
  { desc = "DAP: Toggle breakpoint" })
map("n", "<leader>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
  { desc = "DAP: Set conditional breakpoint" })
map("n", "<leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
  { desc = "DAP: Set log point" })
map("n", "<leader>cb", function() require("dap").clear_breakpoints() end,
  { desc = "DAP: Clear all breakpoints" })

-- Debugging UI
map("n", "<leader>du", function() require("dapui").toggle() end,
  { desc = "DAP: Toggle debugging UI" })
map("n", "<leader>dr", function() require("dap").repl.open() end,
  { desc = "DAP: Open REPL" })
map("n", "<leader>dl", function() require("dap").run_last() end,
  { desc = "DAP: Run last configuration" })

-- Variable inspection
map({ "n", "v" }, "<leader>dh", function() require("dap.ui.widgets").hover() end,
  { desc = "DAP: Hover inspect variable" })
map({ "n", "v" }, "<leader>dp", function() require("dap.ui.widgets").preview() end,
  { desc = "DAP: Preview variable" })
map("n", "<leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end, { desc = "DAP: View call stack" })
map("n", "<leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, { desc = "DAP: View scopes" })

-- Dropbar navigation
map('n', '<Leader>;', api.pick, { desc = "Dropbar: Pick element" })
map('n', '[c', api.goto_context_start, { desc = "Dropbar: Go to context start" })
map('n', ']c', api.select_next_context, { desc = "Dropbar: Select next context" })

-- 普通模式：<leader>cc 注释当前行，<leader>cu 取消注释
map('n', '<leader>cc', ':TComment<CR>', { desc = '取消/注释当前行' })

-- 可视模式：<leader>cc 注释选中区域，<leader>cu 取消选中区域注释
map('v', '<leader>cc', ":'<,'>TComment<CR>", { desc = '取消/注释选中区域' })


map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find Files (包括隐藏文件)' })
map('n', '<leader>fF', '<cmd>Telescope find_files no_ignore=true<cr>', { desc = 'Find Files (包括忽略文件)' })

-- 内容搜索
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = '项目内内容搜索' })
map('n', '<leader>fG', '<cmd>Telescope live_grep grep_open_files=true<cr>', { desc = '仅搜索打开的文件内容' })

-- 缓冲区相关
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = '搜索缓冲区' })
map('n', '<leader>fB', '<cmd>Telescope buffers show_all_buffers=true<cr>', { desc = '搜索所有缓冲区' })

-- 特定场景搜索
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = '搜索帮助文档' })
map('n', '<leader>fm', '<cmd>Telescope marks<cr>', { desc = '搜索标记' })
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = '搜索诊断信息' })
map('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = '搜索命令' })
-- internal terminal
map("n", "<C-\\>", ":ToggleTerm<CR>")

