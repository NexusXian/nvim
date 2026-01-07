local lsp_common = require('config.lspconfig.init')

vim.lsp.config('clangd', {
  capabilities = lsp_common.capabilities,
  cmd = { "clangd" },

  on_new_config = function(new_config, root_dir)
    local ft = vim.bo.filetype

    if ft == "c" then
      new_config.init_options = {
        fallbackFlags = { "-std=c23" }
      }

    elseif ft == "cpp" or ft == "cc" or ft == "cxx" then
      new_config.init_options = {
        fallbackFlags = { "-std=c++23" }
      }
    end
  end,
})

