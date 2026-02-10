-- 公共 LSP 配置：capabilities / format_on_save / cmp 格式 / diagnostic 行尾报错

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspkind = require("lspkind")

----------------------------------------------------------------
-- capabilities（给所有 LSP 复用）
----------------------------------------------------------------
local capabilities = cmp_nvim_lsp.default_capabilities()

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
-- cmp 补全项格式（lspkind + 来源标签）
----------------------------------------------------------------
local custom_format = function(entry, vim_item)
  vim_item = lspkind.cmp_format({
    mode = "symbol_text",
    maxwidth = 50,
    ellipsis_char = "...",
  })(entry, vim_item)

  vim_item.menu = string.format(" [%s]", ({
    nvim_lsp = "LSP",
    luasnip = "Snippet",
    buffer = "Buffer",
    path = "Path",
    copilot = "AI",
  })[entry.source.name] or "")

  return vim_item
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
  signs = true,          -- 左侧符号列
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
  format = custom_format,
}
