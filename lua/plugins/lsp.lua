return {
	'neovim/nvim-lspconfig',
  event = "VeryLazy",
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
		'onsails/lspkind.nvim',
	},
	config = function()
		-- 引入公共配置
		local lsp_common = require('config.lspconfig.init')
		local mason_lsp = require('mason-lspconfig')

		-- 加载所有 LSP 服务器配置
		require('config.lspconfig.cssls')
		require('config.lspconfig.html')
		require('config.lspconfig.eslint')
		require('config.lspconfig.lua_ls')
		require('config.lspconfig.clangd')
		require('config.lspconfig.rust')
		require('config.lspconfig.vue')
		-- 配置 mason-lspconfig
		mason_lsp.setup({
			ensure_installed = {
				'lua_ls',
				'eslint',
				'html',
				'cssls',
				'clangd',
				'gopls',
				'rust_analyzer',
				'ts_ls',
				'vue_ls',
			},
			automatic_enable = true,
		})
	end,
}
