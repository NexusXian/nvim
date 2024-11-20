-- 安装并加载 `nvim-cmp`
local cmp = require('cmp')

cmp.setup({
    snippet = {
        -- 代码片段引擎配置
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- 向上滚动文档
        ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- 向下滚动文档
        ['<C-Space>'] = cmp.mapping.complete(),  -- 手动触发补全
        ['<C-e>'] = cmp.mapping.abort(),         -- 关闭补全
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- 确认补全
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },   -- LSP 补全
        { name = 'luasnip' },    -- 代码片段补全
        { name = 'path' },       -- 文件路径补全
    }, {
        { name = 'buffer' },     -- 缓冲区补全
    }),
    formatting = {
        -- 可选：为补全添加图标
        format = require('lspkind').cmp_format({
            mode = 'symbol',       -- 显示符号
            maxwidth = 50,         -- 最大宽度
            ellipsis_char = '...', -- 超出长度显示省略号
        }),
    },
})

