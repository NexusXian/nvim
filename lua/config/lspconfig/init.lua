local M = {}

-- 获取 blink 兼容的 capabilities
-- 注意：这里不再需要引用 cmp_nvim_lsp
M.capabilities = require("blink.cmp").get_lsp_capabilities()

-- 通用：保存时自动格式化 (逻辑保持不变)
M.format_on_save = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        -- 提示：blink 也可以通过配置实现格式化，但这里保留你的自定义逻辑
        vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
      end,
    })
  end
end

return M
