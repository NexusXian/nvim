local lspconfig = require('lspconfig')
local lsp_common = require('config.lspconfig.init')

lspconfig.eslint.setup({
  capabilities = lsp_common.capabilities,
  on_attach = function(client, bufnr)
    -- 先执行 ESLint 修复，再执行通用格式化
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',
    })
  end,
})
