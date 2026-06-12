return {
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("presence").setup({
        -- 自动根据打开文件、切换 Buffer 等事件更新状态
        auto_update = true,

        -- 鼠标移到 Neovim 图标时显示
        neovim_image_text = "Neovim",

        -- "neovim"：主要显示 Neovim 图标
        -- "file"：主要显示当前语言/文件类型图标
        main_image = "file",

        -- Discord 应用 ID，通常不要修改
        client_id = "793271441293967371",

        -- 更新防抖时间，单位为秒
        debounce_timeout = 10,

        -- 是否显示当前行数
        enable_line_number = false,

        -- 是否显示运行时长
        show_time = true,

        -- 禁止某些文件或目录显示状态
        blacklist = {
          "%.env",
          "secrets",
          "credentials",
          "/private/",
        },

        -- 避免显示 GitHub 按钮或仓库链接
        buttons = false,

        editing_text = "Editing %s",
        file_explorer_text = "Browsing %s",
        git_commit_text = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text = "Reading %s",
        workspace_text = "Working on %s",
        line_number_text = "Line %s out of %s",
      })
    end,
  },
}
