-- mason.lua
local mason_status, mason = pcall(require, "mason")
if not mason_status then
 vim.notify("没有找到 mason")
 return
end

local nlsp_status, nvim_lsp = pcall(require, "lspconfig")
if not nlsp_status then
 vim.notify("没有找到 lspconfig")
 return
end

local mlsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlsp_status then
 vim.notify("没有找到 mason-lspconfig")
 return
end


mason.setup()
mason_lspconfig.setup({})
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",      -- Lua 语言服务器
        "golangci_lint_ls",       -- Go 语言服务器
        "clangd",      -- C/C++ 语言服务器
        "pyright",     -- Python 语言服务器
        "remark_ls",   -- Markdown 语言服务器
        "jdtls",       -- Java 语言服务器
    },
    automatic_installation = true, -- 启用自动安装
})
