-- clangd：C/C++ LSP（标准版本 fallback + cpp 4 空格缩进）
vim.lsp.config('clangd', {
  cmd = { "clangd" },

  on_attach = function(_, bufnr)
    if vim.bo[bufnr].filetype == "cpp" then
      vim.bo[bufnr].tabstop = 4
      vim.bo[bufnr].softtabstop = 4
      vim.bo[bufnr].shiftwidth = 4
      vim.bo[bufnr].expandtab = true
    end
  end,

  on_new_config = function(new_config)
    -- 无 compile_commands.json 时的标准版本 fallback
    -- （.cc/.cxx 的 filetype 也是 cpp，统一走 cpp 分支）
    local ft = vim.bo.filetype

    if ft == "c" then
      new_config.init_options = {
        fallbackFlags = { "-std=c23" }
      }

    elseif ft == "cpp" then
      new_config.init_options = {
        fallbackFlags = { "-std=c++23" }
      }
    end
  end,
})

-- 启用 clangd 服务器（自动在 C/C++ 文件中激活）
vim.lsp.enable('clangd')
