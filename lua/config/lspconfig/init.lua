-- 公共 LSP 配置：capabilities 全局注入 / diagnostic 悬停报错

----------------------------------------------------------------
-- capabilities（通过 '*' 全局注入给所有 LSP，含 roslyn.nvim）
----------------------------------------------------------------
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config('*', { capabilities = capabilities })

----------------------------------------------------------------
-- Diagnostic 配置：行内只留红/黄波浪线，详细报错走悬停浮窗
----------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = false,       -- 不在代码右侧铺开报错文本，保证可读性
  signs = false,          -- 左侧符号列
  underline = true,      -- 红色/黄色波浪线标记
  update_in_insert = false, -- 插入模式不刷新
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
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
-- 对外导出（roslyn.nvim 等插件使用）
----------------------------------------------------------------
return {
  capabilities = capabilities,
}
