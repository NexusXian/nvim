return {
  -- LSP 核心配置
  {
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

      -- 定义格式化函数
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

      -- 配置各 LSP 服务器
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
          'jdtls',
        },
        automatic_installation = true,
      })
    end,
  },

  -- 自动补全
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  },

  -- 语法高亮
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'c', 'cpp', 'go', 'lua', 'html', 'css', 'javascript', 'java',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- Mason 包管理
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    opts = {
      ensure_installed = {
        'lua-language-server',
        'eslint-lsp',
        'html-lsp',
        'css-lsp',
        'clangd',
        'gopls',
        'jdtls',
      },
    },
    config = function(_, opts)
      require('mason').setup(opts)
      local mr = require('mason-registry')
      for _, tool in ipairs(opts.ensure_installed) do
        if not mr.is_installed(tool) then
          mr.get_package(tool):install()
        end
      end
    end,
  },
}

