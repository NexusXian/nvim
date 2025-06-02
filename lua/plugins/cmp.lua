return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lua',
		'L3MON4D3/LuaSnip',
		'rafamadriz/friendly-snippets',
		'onsails/lspkind.nvim', -- 确保添加 lspkind 依赖
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local lspkind = require('lspkind') -- 引入 lspkind
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
				{ name = 'copilot' },
			}),
			formatting = { -- 添加格式化配置
				format = lspkind.cmp_format({
					mode = 'symbol_text', -- 显示图标和文本
					maxwidth = 50, -- 最大宽度
					ellipsis_char = '...', -- 超出宽度时的省略符号

					-- 为不同的补全源添加图标前缀
					before = function(entry, vim_item)
						-- 为 Copilot 补全添加图标
						if entry.source.name == 'copilot' then
							vim_item.kind = ' ' .. vim_item.kind
							vim_item.kind_hl_group = 'CmpItemKindCopilot'
						end

						-- 为 luasnip 补全添加图标
						if entry.source.name == 'luasnip' then
							vim_item.kind = ' ' .. vim_item.kind
						end

						-- 为 buffer 补全添加图标
						if entry.source.name == 'buffer' then
							vim_item.kind = ' ' .. vim_item.kind
						end

						-- 为 path 补全添加图标
						if entry.source.name == 'path' then
							vim_item.kind = ' ' .. vim_item.kind
						end

						return vim_item
					end
				})
			},
		})
	end,
}
