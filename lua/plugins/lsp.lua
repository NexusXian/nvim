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

      -- 配置各 LSP 服务器（使用 lspconfig 标准名称）
      -- CSS/SCSS/Less (对应 Mason 包: css-lsp)
      lspconfig.cssls.setup({
        capabilities = capabilities,
        settings = {
          css = { validate = true, lint = { unknownAtRules = 'ignore' } },
          scss = { validate = true },
          less = { validate = true },
        },
        on_attach = format_on_save,
      })

      -- HTML (对应 Mason 包: html-lsp)
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = format_on_save,
      })

      -- ESLint (对应 Mason 包: eslint-lsp)
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll', -- 保存时自动修复 ESLint 错误
          })
          format_on_save(client, bufnr)
        end,
      })

      -- Lua (对应 Mason 包: lua-language-server)
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

      -- C/C++ (对应 Mason 包: clangd)
      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = format_on_save,
      })

      -- Go (对应 Mason 包: gopls)
      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = format_on_save,
      })

      -- Java (对应 Mason 包: jdtls)
      lspconfig.jdtls.setup({
        capabilities = capabilities,
        on_attach = format_on_save,
      })

      -- Mason-LSP 自动安装配置（使用 lspconfig 标准名称）
      mason_lsp.setup({
        ensure_installed = {
          'lua_ls',        -- Lua
          'eslint',        -- ESLint
          'html',          -- HTML
          'cssls',         -- CSS/SCSS/Less
          'clangd',        -- C/C++
          'gopls',         -- Go
          'jdtls',         -- Java
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
        -- LSP 服务器（使用 Mason 包名，与上面 lspconfig 名称不同）
        'lua-language-server',  -- 对应 lspconfig.lua_ls
        'eslint-lsp',           -- 对应 lspconfig.eslint
        'html-lsp',             -- 对应 lspconfig.html
        'css-lsp',              -- 对应 lspconfig.cssls
        'clangd',               -- 对应 lspconfig.clangd
        'gopls',                -- 对应 lspconfig.gopls
        'jdtls',                -- 对应 lspconfig.jdtls
        -- 可选：格式化工具
        -- 'prettier', 'stylua', 'clang-format',
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
