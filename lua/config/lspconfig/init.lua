-- 公共 LSP 配置：capabilities / format_on_save / diagnostic 行尾报错

----------------------------------------------------------------
-- capabilities（给所有 LSP 复用）
----------------------------------------------------------------
local capabilities = require("blink.cmp").get_lsp_capabilities()

----------------------------------------------------------------
-- 保存时自动格式化
----------------------------------------------------------------
local format_on_save = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          timeout_ms = 2000,
        })
      end,
    })
  end
end

----------------------------------------------------------------
-- Diagnostic 配置：❗报错直接显示在行尾
----------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = {
    prefix = "󰅚",       -- 行尾提示图标
    spacing = 2,         -- 与代码的间距
    source = "if_many",  -- 多来源才显示
  },
  signs = false,          -- 左侧符号列
  underline = true,      -- 波浪线
  update_in_insert = false, -- 插入模式不刷新（推荐）
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

----------------------------------------------------------------
-- 插入模式隐藏行尾报错，退出插入模式再显示（可选但强烈推荐）
----------------------------------------------------------------
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.diagnostic.config({ virtual_text = false })
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.diagnostic.config({ virtual_text = true })
  end,
})

----------------------------------------------------------------
-- 光标停留自动显示详细错误浮窗（接近 VS Code）
----------------------------------------------------------------
vim.o.updatetime = 300
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

----------------------------------------------------------------
-- 对外导出
----------------------------------------------------------------
return {
  capabilities = capabilities,
  format_on_save = format_on_save,
}
