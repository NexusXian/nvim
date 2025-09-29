-- 公共配置：初始化 lspkind、capabilities、通用函数
local cmp_nvim_lsp = require('cmp_nvim_lsp')  -- 保留补全能力依赖

-- 初始化 lspkind（用于补全图标）
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

-- 获取 cmp 兼容的 capabilities（供所有 LSP 服务器复用）
local capabilities = cmp_nvim_lsp.default_capabilities()

-- 通用：保存时自动格式化（供 on_attach 调用）
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

-- 自定义补全项显示格式（供 cmp 配置使用）
local custom_format = function(entry, vim_item)
  -- 前缀添加图标
  if lspkind.symbol_map[vim_item.kind] then
    vim_item.kind = lspkind.symbol_map[vim_item.kind] .. ' ' .. vim_item.kind
  end

  -- 后缀添加来源标识
  vim_item.menu = string.format(' [%s]', ({
    nvim_lsp = 'LSP',
    luasnip = 'Snippet',
    buffer = 'Buffer',
    path = 'Path',
  })[entry.source.name] or '')

  return vim_item
end

return {
  capabilities = capabilities,         -- 导出补全能力配置
  format_on_save = format_on_save,     -- 导出保存时格式化函数
  format = custom_format,              -- 导出补全显示格式函数
}
