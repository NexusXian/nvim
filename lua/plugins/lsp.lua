return {
	'neovim/nvim-lspconfig',
  event = "VeryLazy",
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'saghen/blink.cmp',
	},
	config = function()
		-- 公共配置：capabilities 全局注入 + diagnostic 显示规则
		require('config.lspconfig.init')

		-- 加载所有 LSP 服务器配置（各文件内部自行 vim.lsp.enable）
		require('config.lspconfig.cssls')
		require('config.lspconfig.html')
		require('config.lspconfig.oxlint')
		require('config.lspconfig.lua_ls')
		require('config.lspconfig.clangd')
		require('config.lspconfig.rust')
		require('config.lspconfig.ts')     -- ts_ls（React+Vue）+ vue_ls
		require('config.lspconfig.pyright')
		require('config.lspconfig.zls')
		require('config.lspconfig.json')
		require('config.lspconfig.yaml')
		require('config.lspconfig.protobuf')

		-- gopls 使用 nvim-lspconfig 默认配置（go.nvim 的 lsp_cfg 已禁用）
		vim.lsp.enable('gopls')

		-- mason-lspconfig 只负责安装，启用由各配置文件控制
		require('mason-lspconfig').setup({
			ensure_installed = {
				'lua_ls',
				'oxlint',
				'html',
				'cssls',
				'clangd',
				'gopls',
				'rust_analyzer',
				'ts_ls',
				'vue_ls',
				'pyright',
				'zls',
				'jsonls',
				'yamlls',
				'buf_ls',
			},
			automatic_enable = false,
			-- C# 由 roslyn.nvim 负责；eslint 已由 oxlint 取代
		})
	end,
}
