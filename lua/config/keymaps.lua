-- 快捷函数
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 在插入模式下将 jk 映射为 Esc
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- 在普通模式下映射 Ctrl + a 为全选操作
vim.keymap.set('n', '<C-a>', function()
  vim.cmd('normal! ggVG')
end, { noremap = true, silent = true })

-- normal模式下使用大写的Y来共享剪切板
vim.keymap.set('n', 'Y', '"+yy', { noremap = true, silent = true })

-- visual模式下使用大写的Y来共享剪切板
vim.keymap.set('v', 'Y', '"+y', { noremap = true, silent = true })

local term_bufnr = nil
-- 在普通模式下映射 Ctrl + / 为开启终端
vim.keymap.set('n', '<C-/>', function()
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

