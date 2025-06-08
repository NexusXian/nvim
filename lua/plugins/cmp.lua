return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lua',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

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
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            -- 如果没有手动选择任何项，则不自动确认
            if not entry then
              fallback()
              return
            end
            cmp.confirm({ select = false }) -- 使用 select = false 避免自动选择
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
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
        {
          name = 'copilot',
          entry_filter = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            if col == 0 then return false end
            local current_line = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
            if current_line:match("^%s*$") then return false end
            local before_cursor = current_line:sub(1, col)
            return before_cursor:match("%S") ~= nil
          end
        },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          fields = { "kind", "abbr", "menu" },
          before = function(entry, vim_item)
            if entry.source.name == 'copilot' then
              vim_item.kind = ' ' .. vim_item.kind
              vim_item.kind_hl_group = 'CmpItemKindCopilot'
            elseif entry.source.name == 'luasnip' then
              vim_item.kind = ' ' .. vim_item.kind
            elseif entry.source.name == 'buffer' then
              vim_item.kind = ' ' .. vim_item.kind
            elseif entry.source.name == 'path' then
              vim_item.kind = ' ' .. vim_item.kind
            end
            return vim_item
          end,
        })
      },
      completion = {
        completeopt = 'menu,menuone,noselect', -- 关键变化：使用 noselect 而不是 noinsert
        keyword_length = 1,
      },
      -- 新增：预选择配置
      preselect = cmp.PreselectMode.None, -- 禁用预选择
    })
  end,
}
