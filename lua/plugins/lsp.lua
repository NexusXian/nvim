return {
	'neovim/nvim-lspconfig',
  event = "VeryLazy",
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'saghen/blink.cmp',
	},
	config = function()
		-- 引入公共配置
		local lsp_common = require('config.lspconfig.init')
		local mason_lsp = require('mason-lspconfig')

		-- 加载所有 LSP 服务器配置
		require('config.lspconfig.cssls')
		require('config.lspconfig.html')
		require('config.lspconfig.oxlint')
		require('config.lspconfig.lua_ls')
		require('config.lspconfig.clangd')
		require('config.lspconfig.rust')
		require('config.lspconfig.vue')
		-- 配置 mason-lspconfig
		mason_lsp.setup({
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
			},
			-- C# 由 roslyn.nvim 负责，避免 csharp_ls 重复挂载
			-- eslint 已由 oxlint 取代，避免 mason-lspconfig 自动重新启用
			automatic_enable = { exclude = { 'csharp_ls', 'eslint' } },
		})
	end,
}
