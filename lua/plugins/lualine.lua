return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- 可选，用于美化图标
        config = function()
            require("lualine").setup {
                options = {
                    theme = "dracula", -- 选择主题，例如 'gruvbox', 'dracula', 'tokyonight' 等
                    section_separators = "",
                    component_separators = "|",
                },
            }
        end,
    },
}

