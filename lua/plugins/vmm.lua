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

    -- VM 启动时会覆盖 blink.cmp 的 buffer 级 insert 映射(<CR>/<Up>/<Down> 等)，退出时只 iunmap 不恢复；
    -- 退出后清掉残留的 blink 映射，下次 InsertEnter 时 blink 会完整重新应用
    vim.api.nvim_create_autocmd("User", {
      pattern = "visual_multi_exit",
      callback = function()
        for _, m in ipairs(vim.api.nvim_buf_get_keymap(0, "i")) do
          if m.desc and vim.startswith(m.desc, "blink.cmp:") then
            vim.api.nvim_buf_del_keymap(0, "i", m.lhs)
          end
        end
      end,
    })
  end,
}
