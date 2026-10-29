-- 配置 oxlint 服务器（cmd/filetypes/root_dir 复用 nvim-lspconfig 默认值：
-- 优先项目本地 node_modules/.bin/oxlint，其次 PATH）
local base_on_attach = vim.lsp.config.oxlint.on_attach
vim.lsp.config('oxlint', {
  on_attach = function(client, bufnr)
    -- 保留 nvim-lspconfig 内置的 :LspOxlintFixAll 命令
    if base_on_attach then
      base_on_attach(client, bufnr)
    end
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'LspOxlintFixAll',  -- 保存时自动修复可修复的 Oxlint 问题
    })
  end,
})

-- 启用 oxlint 服务器（JS/JSX/TS/TSX/Vue/Svelte/Astro）
vim.lsp.enable('oxlint')
