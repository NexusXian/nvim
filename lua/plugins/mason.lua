return {
  'williamboman/mason.nvim',
  build = ':MasonUpdate',
  opts = {
    ensure_installed = {
      'lua-language-server',
      'eslint-lsp',
      'html-lsp',
      'css-lsp',
      'c3-lsp',
      'clangd',
      'pyright',
      "zls",
      'typescript-language-server',
      'vetur-vls vuels',
    },
  },
  config = function(_, opts)
    require('mason').setup(opts)
    local registry = require('mason-registry')

    for _, tool in ipairs(opts.ensure_installed) do
      local ok, package = pcall(registry.get_package, tool)
      if ok and not package:is_installed() then
        package:install()
      end
    end
  end,
}
