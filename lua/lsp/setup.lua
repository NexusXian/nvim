-- 通用的 on_attach 函数，关闭默认格式化功能
local function on_attach_disable_formatting(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
end

-- 通用 flags 配置
local common_flags = {
    debounce_text_changes = 150,
}

-- 语言服务器设置
local servers = {
    sumneko_lua = {
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
                diagnostics = { globals = { 'vim' } },
                workspace = { library = vim.api.nvim_get_runtime_file('', true), checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    },
    golangci_lint_ls  = {
        settings = {
            golangci_lint_ls  = {
                analyses = { unusedparams = true },
                staticcheck = true,
                format = { enabled = false }, -- 禁用 go 的格式化
            },
        },
    },
    clangd = {
        cmd = { "clangd" },
    },
    pyright = {
        settings = {
            python = {
                analysis = { typeCheckingMode = "basic" },
            },
        },
    },
    remark_ls = {
        settings = {
            remark = { lint = true },
        },
    },
    jdtls = {
        cmd = { "jdt-ls", "-configuration", "/path/to/jdtls/config", "-data", "/path/to/workspace" },
        settings = {
            java = {
                format = { enabled = false }, -- 禁用 Java 的格式化
                contentProvider = { preferred = "fernflower" },
            },
        },
    },
}

-- 加载 LSP 配置
return {
    on_setup = function(server)
        if servers[server.name] then
            local opts = servers[server.name]
            opts.on_attach = on_attach_disable_formatting
            opts.flags = common_flags
            server:setup(opts)
        end
    end,
}

