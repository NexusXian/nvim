local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'luasnip' },
    },
})

require('tabnine').setup({
    disable_auto_comment = true, -- 禁用自动注释
    accept_keymap = "<C-y>",      -- 确认补全的快捷键
    dismiss_keymap = "<C-e>",     -- 取消补全的快捷键
    suggestions = {
        -- 设置建议的最大数量
        count = 5,
    },
})

