return {
  "mg979/vim-visual-multi",
  branch = "master",
  lazy = true, -- 启用懒加载
  event = "VeryLazy", -- 延迟到启动后期加载
  init = function()
    -- 保留原有的快捷键设置
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Find Subword Under"] = "<C-n>",
    }
  end,
}
