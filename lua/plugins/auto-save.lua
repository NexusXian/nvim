return {
  "Pocco81/auto-save.nvim",

  event = { "InsertLeave", "BufLeave", "FocusLost" },

  opts = {
    enabled = true,

    -- 自动保存触发事件
    trigger_events = {
      "InsertLeave", -- 退出插入模式
      "BufLeave",    -- 切换buffer
      "FocusLost",   -- nvim失去焦点
    },

    -- 防止频繁写盘
    debounce_delay = 200,

    -- 不显示保存提示
    execution_message = {
      message = function()
        return ""
      end,
    },

    -- 自动保存条件
    condition = function(buf)
      local fn = vim.fn

      -- 文件必须可修改
      if fn.getbufvar(buf, "&modifiable") ~= 1 then
        return false
      end

      -- 忽略特殊文件类型
      local ignore_filetype = {
        "TelescopePrompt",
        "neo-tree",
        "lazy",
        "mason",
        "toggleterm",
        "dashboard",
      }

      local ft = vim.bo[buf].filetype

      for _, v in ipairs(ignore_filetype) do
        if ft == v then
          return false
        end
      end

      return true
    end,

    -- 是否保存所有buffer
    write_all_buffers = false,
  },

  config = function(_, opts)
    require("auto-save").setup(opts)

    -- 手动开关自动保存
    vim.keymap.set(
      "n",
      "<leader>as",
      "<cmd>ASToggle<CR>",
      { desc = "Toggle Auto Save" }
    )
  end,
}
