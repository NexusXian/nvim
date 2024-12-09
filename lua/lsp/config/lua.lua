local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local lua_opts = {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require('keybindings').mapLSP(buf_set_keymap)
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end,
}

local gopls_opts = {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true, -- 启用未使用参数分析
            },
            staticcheck = true, -- 启用静态检查
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require('keybindings').mapLSP(buf_set_keymap)
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end,
}

local clangd_opts = {
    cmd = { "clangd" },
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require('keybindings').mapLSP(buf_set_keymap)
    end,
}

local pyright_opts = {
    settings = {
        pyright = {
            typeCheckingMode = "basic", -- 设置类型检查模式
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require('keybindings').mapLSP(buf_set_keymap)
    end,
}

local remark_ls_opts = {
    settings = {
        remark = {
            lint = true, -- 启用 linting
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require('keybindings').mapLSP(buf_set_keymap)
    end,
}

local jdtls_opts = {
    cmd = { "jdt-ls", "-configuration", "/path/to/jdtls/config", "-data", "/path/to/workspace" },
    settings = {
        java = {
            format = {
                enabled = true, -- 启用格式化
            },
            contentProvider = {
                preferred = "fernflower", -- 使用的反编译器
            },
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true -- 允许格式化
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require('keybindings').mapLSP(buf_set_keymap)
    end,
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

