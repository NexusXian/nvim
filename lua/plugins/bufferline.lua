return {
    -- 其他插件...
    {
        "akinsho/bufferline.nvim",
        version = "*", -- 或指定版本号
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- 可选，支持图标
        config = function()
            require("bufferline").setup{}
        end,
    },
}

