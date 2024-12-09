-- 通用的 on_attach 函数，关闭默认格式化功能
local function on_attach_disable_formatting(client, bufnr)
    -- 关闭默认格式化功能
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    -- 绑定快捷键
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    require('keybindings').mapLSP(buf_set_keymap)
end

-- 通用 flags 配置
local common_flags = {
    debounce_text_changes = 150,
}

-- Lua language server configuration
local lua_opts = {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file('', true), checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
    flags = common_flags,
    on_attach = on_attach_disable_formatting,
}

-- Go language server configuration
local gopls_opts = {
    settings = {
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
        },
    },
    flags = common_flags,
    on_attach = on_attach_disable_formatting,
}

-- C/C++ language server configuration
local clangd_opts = {
    cmd = { "clangd" },
    flags = common_flags,
    on_attach = on_attach_disable_formatting,
}

-- Python language server configuration
local pyright_opts = {
    settings = {
        python = {
            analysis = { typeCheckingMode = "basic" },
        },
    },
    flags = common_flags,
    on_attach = on_attach_disable_formatting,
}

-- Markdown language server configuration
local remark_ls_opts = {
    settings = {
        remark = { lint = true },
    },
    flags = common_flags,
    on_attach = on_attach_disable_formatting,
}

-- Java language server configuration
local jdtls_opts = {
    cmd = { "jdt-ls", "-configuration", "/path/to/jdtls/config", "-data", "/path/to/workspace" },
    settings = {
        java = {
            format = { enabled = false }, -- 也禁用 Java 的格式化功能
            contentProvider = { preferred = "fernflower" },
        },
    },
    flags = common_flags,
    on_attach = on_attach_disable_formatting,
}

-- 返回配置
return {
    on_setup = function(server)
        if server.name == 'sumneko_lua' then
            server:setup(lua_opts)
        elseif server.name == 'gopls' then
            server:setup(gopls_opts)
        elseif server.name == 'clangd' then
            server:setup(clangd_opts)
        elseif server.name == 'pyright' then
            server:setup(pyright_opts)
        elseif server.name == 'remark_ls' then
            server:setup(remark_ls_opts)
        elseif server.name == 'jdtls' then
            server:setup(jdtls_opts)
        end
    end,
}

