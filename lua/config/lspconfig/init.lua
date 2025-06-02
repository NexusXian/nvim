-- 公共配置：初始化 lspkind、capabilities、通用函数
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- 初始化 lspkind
require('lspkind').init({
  mode = 'symbol_text',
  preset = 'codicons',
  symbol_map = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
  },
})

-- 获取 cmp 兼容的 capabilities
local capabilities = cmp_nvim_lsp.default_capabilities()

-- 通用：保存时格式化
local format_on_save = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
      end,
    })
  end
end

return {
  capabilities = capabilities,
  format_on_save = format_on_save,
}
