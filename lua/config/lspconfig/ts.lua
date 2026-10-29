-- ts_ls + vue_ls：Vue 混合支持 + React (TSX/JSX) 优化
-- ts_ls 由 @vue/typescript-plugin 接管 .vue 内的 TS 支持，同时保留 React 增强配置

local vue_language_server_path = vim.fn.stdpath('data')
  .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'

vim.lsp.config('ts_ls', {
  -- Vue 官方混合方案：ts_ls 在 .vue 文件中使用 @vue/typescript-plugin
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

  -- tsx/jsx 后缀适配 React 单文件组件，vue 交给上面的插件
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
  },

  -- 优先识别项目根目录（package.json/tsconfig.json/jsconfig.json）
  root_dir = require('lspconfig.util').root_pattern(
    'package.json',
    'tsconfig.json',
    'jsconfig.json',
    '.git'
  ),

  on_attach = function(client, bufnr)
    -- 禁用 tsserver 格式化（格式化手动触发，走 prettier/conform）
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- ========== React 专属：自动导入核心配置 ==========
    -- 快捷键：<leader>ia (Import Auto) 触发 React 模块自动导入
    vim.keymap.set('n', '<leader>ia', function()
      vim.lsp.buf.code_action({
        filter = function(action)
          -- 精准匹配 React 相关的导入提示（兼容中英文）
          return action.title:find('Import %w+') ~= nil
              or action.title:find('Add import') ~= nil
              or action.title:find('导入 %w+') ~= nil
              -- 额外匹配 React Hooks 导入（比如 Import useState from 'react'）
              or action.title:find('react') ~= nil
        end,
        apply = true -- 自动导入（多来源时可设为 false 手动选择）
      })
    end, {
      buffer = bufnr,
      desc = 'React/TSX 自动导入未引入的模块（Hooks/组件）'
    })

    -- ========== React 开发体验优化 ==========
    -- 1. 光标悬停提示 React 导入建议（新手友好）
    vim.api.nvim_create_autocmd('CursorHold', {
      buffer = bufnr,
      callback = function()
        local params = vim.lsp.util.make_position_params()
        client.request('textDocument/codeAction', {
          textDocument = params.textDocument,
          range = params.range,
          context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr) }
        }, function(err, result)
          if err or not result then return end
          local import_actions = vim.tbl_filter(function(action)
            return action.title:find('Import %w+') ~= nil and action.title:find('react') ~= nil
          end, result)
          if #import_actions > 0 then
            vim.notify('React 导入提示：按 <leader>ia 导入 ' .. import_actions[1].title,
              vim.log.levels.INFO, { timeout = 3000 })
          end
        end)
      end
    })

    -- 2. 保存时优化 React 导入（整理+自动修复）
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function()
        -- 先整理 React 导入（删除未使用的 Hooks/组件）
        vim.lsp.buf.code_action({
          filter = function(action)
            return action.title == 'Organize imports'
                or action.title == '整理导入'
          end,
          apply = true
        })
        -- 自动修复 React 相关的 lint 问题（如 Hooks 规则）
        vim.lsp.buf.code_action({
          filter = function(action)
            return action.title:find('Fix all') ~= nil
          end,
          apply = true
        })
      end,
      desc = '保存时优化 React/TSX 导入和代码修复'
    })
  end,

  -- React 专属的 tsserver 配置
  settings = {
    completions = {
      -- 优先补全 React 相关的模块（如 react、react-dom、@types/react）
      completeFunctionCalls = true,
      completeImportStatements = true,
    },
    typescript = {
      inlayHints = {
        -- React 开发常用的类型提示
        includeInlayVariableTypeHints = true,
        includeInlayParameterNameHints = "all", -- 显示 Hooks 参数名（如 useState 的 setX）
        includeInlayFunctionLikeReturnTypeHints = true, -- 显示组件返回值类型
        includeInlayPropertyDeclarationTypeHints = true,
      },
      -- 识别 React 18+ 的新语法（如 createRoot）
      preferences = {
        jsxAttributeCompletionStyle = "auto", -- 自动补全 JSX 属性
        quotePreference = "single", -- React 项目常用单引号
        importModuleSpecifierPreference = "relative", -- 优先相对路径导入组件
      },
    },
    javascript = {
      inlayHints = {
        includeInlayVariableTypeHints = true,
      },
    },
  },
})

-- 启用 ts_ls（JS/TS/JSX/TSX/Vue）与 vue_ls（.vue 单文件组件）
vim.lsp.enable({ 'ts_ls', 'vue_ls' })
