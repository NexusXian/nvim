-- Shortcut functions
--
local map = vim.keymap.set
local api = require("dropbar.api")

-- Map 'jk' to Esc in insert mode
map('i', 'jk', '<Esc>', { noremap = true, silent = true, desc = "Exit insert mode" })

-- Map Ctrl + a to select all in normal mode
map('n', '<leader>sa', function()
  vim.cmd('normal! ggVG')
end, { noremap = true, silent = true, desc = "Select all text" })

-- 
-- Use uppercase Y to copy to system clipboard in normal mode
map('n', 'Y', '"+yy', { noremap = true, silent = true, desc = "Yank line to system clipboard" })

-- Use uppercase Y to copy to system clipboard in visual mode
map('v', 'Y', '"+y', { noremap = true, silent = true, desc = "Yank selection to system clipboard" })

-- Plugin key mappings

-- BufferLine tab navigation
map("n", "H", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "L", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
-- 关闭当前 buffer（不关窗口）
map("n", "<leader>q", function()
  vim.cmd("bdelete")
end, { desc = "Close current buffer" })

-- 关闭其他 buffer
map("n", "<leader>bo", function()
  vim.cmd("BufferLineCloseOthers")
end, { desc = "Close other buffers" })

-- 关闭右侧 buffer
map("n", "<leader>br", function()
  vim.cmd("BufferLineCloseRight")
end, { desc = "Close right buffers" })

-- 点选关闭 buffer（会出现字母提示）
map("n", "<leader>bp", function()
  vim.cmd("BufferLinePickClose")
end, { desc = "Pick buffer to close" })

-- 点选打开buffer）
map("n", "<leader>bs", function()
  vim.cmd("BufferLinePick")
end, { desc = "Pick buffer to open" })

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
map("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature Documentation" })

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

-- Flutter
map('n', '<leader>fo', '<cmd>FlutterOutlineToggle<CR>', { desc = 'Toggle Flutter Outline' })
map('n', '<leader>fl', '<cmd>FlutterReload<CR>', { desc = 'Flutter Reload' })
map('n', '<leader>fq', '<cmd>FlutterQuit<CR>', { desc = 'Quit Flutter' })
map('n', '<leader>fr', '<cmd>FlutterRun<CR>', { desc = 'Run Flutter' })
map('n', '<leader>fe', '<cmd>FlutterEmulators<CR>', { desc = 'Select Flutter Emulator' })

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
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end,
  { desc = "DAP: Toggle breakpoint" })
map("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
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

-- Normal mode: <leader>cc comment current line, <leader>cu uncomment
map('n', '<leader>cc', ':TComment<CR>', { desc = 'Toggle comment/uncomment current line' })

-- Visual mode: <leader>cc comment selected area, <leader>cu uncomment selected area
map('v', '<leader>cc', " :'<' ,' '>TComment<CR>", { desc = 'Toggle comment/uncomment selected area' })


map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find Files (including hidden files)' })
map('n', '<leader>fF', '<cmd>Telescope find_files no_ignore=true<cr>', { desc = 'Find Files (including ignored files)' })
map('n', '<leader>F', '<cmd>Telescope oldfiles<cr>', { desc = 'Find Files (including ignored files)' })

-- Buffer related
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Search buffers' })
map('n', '<leader>fB', '<cmd>Telescope buffers show_all_buffers=true<cr>', { desc = 'Search all buffers' })

-- 搜索当前文件的函数 / 方法列表
map('n', '<leader>o', function()
  require('telescope.builtin').lsp_document_symbols({
    symbols = { 'function', 'method', 'constructor' },
  })
end, { desc = 'Search functions in current file' })

-- Search all symbols in current file
map('n', '<leader>O', '<cmd>Telescope lsp_document_symbols<cr>', {
  desc = 'Search all symbols in current file',
})

-- 特定场景搜索
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Search help documentation' })
map('n', '<leader>fm', '<cmd>Telescope marks<cr>', { desc = 'Search marks' })
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Search diagnostic information' })
map('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = 'Search commands' })
-- internal terminal
map("n", "<C-t>", ":ToggleTerm<CR>")
-- resize the windows size
map("n", "<M-Up>", "<C-w>+", { noremap = true, silent = true, desc = "Increase window height" })
map("n", "<M-Down>", "<C-w>-", { noremap = true, silent = true, desc = "Decrease window height" })
map("n", "<M-Right>", "<C-w>>", { noremap = true, silent = true, desc = "Increase window width" })
map("n", "<M-Left>", "<C-w><", { noremap = true, silent = true, desc = "Decrease window width" })

--go
map('n', '<leader>gi', '<cmd>GoImports<CR>', { desc = 'Import go package' })
map('n', '<leader>gmt', '<cmd>GoModTidy<CR>', { desc = 'Tidy go.mod' })
--markdown
map('n', '<leader>mk', '<cmd>MarkdownPreview<CR>', { desc = 'preview markdown in browser' })
map('n', '<leader>mks', '<cmd>MarkdownPreviewStop<CR>', { desc = 'stop preview markdown' })

--hop
map("n", "<leader>ww", ":HopWord<CR>", { silent = true })

map("n", "<leader>ll", ":HopLine<CR>", { silent = true })

-- slipe the windows
map("n", "<leader>vs", "<cmd>vsplit<CR>", { noremap = true, silent = true })
map("n", "<leader>sw", "<cmd>split<CR>", { noremap = true, silent = true })

-- yank
map("n", "<leader>fy", "<cmd>Telescope neoclip<cr>", {
  desc = "Clipboard history",
})
