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

    -- 加载 snippet 文件
    require('luasnip.loaders.from_vscode').lazy_load()                                  -- friendly-snippets
    require('luasnip.loaders.from_lua').load({ paths = "~/.config/nvim/lua/snippets" }) -- 你自己的片段

    -- LuaSnip 快捷键绑定（可选）
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.jumpable(1) then luasnip.jump(1) end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if luasnip.jumpable(-1) then luasnip.jump(-1) end
    end, { silent = true })

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

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
            if not entry then
              fallback()
              return
            end
            cmp.confirm({ select = false })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
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
        completeopt = 'menu,menuone,noselect',
        keyword_length = 1,
      },
      preselect = cmp.PreselectMode.None,
    })
  end,
}
