local lsp_common = require('config.lspconfig.init')

local vue_language_server_path = vim.fn.stdpath('data')
  .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'

vim.lsp.config('ts_ls', {
  capabilities = lsp_common.capabilities,
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      },
    },
  },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'vue',
  },
})

vim.lsp.config('vue_ls', {
  capabilities = lsp_common.capabilities,
})

vim.lsp.enable({ 'ts_ls', 'vue_ls' })
