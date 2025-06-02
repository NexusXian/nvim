return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local mason_lsp = require('mason-lspconfig')

    local format_on_save = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    -- LSP servers
    lspconfig.cssls.setup({
      capabilities = capabilities,
      settings = {
        css = { validate = true, lint = { unknownAtRules = 'ignore' } },
        scss = { validate = true },
        less = { validate = true },
      },
      on_attach = format_on_save,
    })

    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = format_on_save,
    })

    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer = bufnr,
          command = 'EslintFixAll',
        })
        format_on_save(client, bufnr)
      end,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
        },
      },
      on_attach = format_on_save,
    })

    lspconfig.clangd.setup({
      capabilities = capabilities,
      on_attach = format_on_save,
    })

    lspconfig.gopls.setup({
      capabilities = capabilities,
      on_attach = format_on_save,
    })

    lspconfig.jdtls.setup({
      capabilities = capabilities,
      on_attach = format_on_save,
    })

    mason_lsp.setup({
      ensure_installed = {
        'lua_ls',
        'eslint',
        'html',
        'cssls',
        'clangd',
        'gopls',
      },
      automatic_installation = true,
    })
  end,
}
