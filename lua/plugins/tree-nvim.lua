return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = false, -- 打开文件后自动关闭 nvim-tree
          },
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        view = {
          width = 30,
          side = "left",
          preserve_window_proportions = true,
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              folder_arrow = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
      })
    end,
  },
}
