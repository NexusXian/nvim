-- 公共配置：初始化 lspkind、capabilities、通用函数
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- 初始化 lspkind
local lspkind = require('lspkind')
lspkind.init({
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

-- 自定义补全格式
local custom_format = function(entry, vim_item)
  -- 在前面添加图标
  if lspkind.symbol_map[vim_item.kind] then
    vim_item.kind = lspkind.symbol_map[vim_item.kind] .. ' ' .. vim_item.kind
  end

  -- 在后面添加来源说明
  vim_item.menu = string.format(' [%s]', ({
    nvim_lsp = 'LSP',
    luasnip = 'Snippet',
    buffer = 'Buffer',
    path = 'Path',
  })[entry.source.name] or '')

  return vim_item
end

return {
  capabilities = capabilities,
  format_on_save = format_on_save,
  format = custom_format, -- 导出自定义格式函数供 cmp 使用
}
