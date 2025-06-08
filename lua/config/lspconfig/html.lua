local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.html.setup({
  capabilities = capabilities,
  init_options = {
    configurationSection = { "html", "javascript", "typescript" },
    embeddedLanguages = {
      javascript = true,
      typescript = true, -- 可选
    },
    provideFormatter = true,
  },
})
