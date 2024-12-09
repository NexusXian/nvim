return {
    {
        "akinsho/toggleterm.nvim",
        version = "*", -- 或指定版本号，例如 "v2.*"
        config = function()
            require("toggleterm").setup {
                size = 20, -- 终端窗口的默认大小
                open_mapping = [[<C-\>]], -- 打开/关闭终端的快捷键
                hide_numbers = true, -- 隐藏行号
                shade_filetypes = {},
                shade_terminals = true, -- 为终端启用背景阴影
                shading_factor = 2, -- 阴影强度（1-3）
                start_in_insert = true, -- 打开终端时进入插入模式
                persist_size = true, -- 记住终端大小
                direction = "float", -- 终端方向，可选 'vertical', 'horizontal', 'tab', 'float'
                float_opts = {
                    border = "curved", -- 边框样式，可选 'single', 'double', 'shadow', 'curved'
                    winblend = 3, -- 透明度（0 不透明，100 全透明）
                },
            }
        end,
    },
}

