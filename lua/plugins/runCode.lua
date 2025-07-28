return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- 或指定版本号，例如 "v2.*"
    config = function()
      local Terminal = require("toggleterm.terminal").Terminal

      require("toggleterm").setup({
        size = 20,                -- 终端窗口的默认大小
        open_mapping = [[<C-\>]], -- 打开/关闭终端的快捷键
        hide_numbers = true,      -- 隐藏行号
        shade_filetypes = {},
        shade_terminals = true,   -- 为终端启用背景阴影
        shading_factor = 2,       -- 阴影强度（1-3）
        start_in_insert = true,   -- 打开终端时进入插入模式
        persist_size = true,      -- 记住终端大小
        direction = "float",      -- 终端方向，可选 'vertical', 'horizontal', 'tab', 'float'
        float_opts = {
          border = "curved",      -- 边框样式，可选 'single', 'double', 'shadow', 'curved'
          winblend = 3,           -- 透明度（0 不透明，100 全透明）
        },
      })

      -- 定义一个全局变量存储动态终端实例
      local dynamic_term = nil

      -- 动态设置终端命令
      local function set_command_for_filetype()
        local filetype = vim.bo.filetype             -- 获取当前文件类型
        local filename = vim.fn.expand("%:t")        -- 获取当前文件名
        local filename_no_ext = vim.fn.expand("%:r") -- 获取不含扩展名的文件名

        if filetype == "go" then
          return "go run " .. filename
        elseif filetype == "java" then
          return "javac " .. filename .. " && java " .. filename_no_ext
        elseif filetype == "cpp" then
          return "g++ " .. filename .. " -o " .. filename_no_ext .. " && ./" .. filename_no_ext
        elseif filetype == "c" then
          return "gcc " .. filename .. " -o " .. filename_no_ext .. " && ./" .. filename_no_ext
        elseif filetype == "python" then
          return "python3 " .. filename
        elseif filetype == "dart" then
          return "dart " .. filename
        elseif filetype == "typescript" then
          return "node " .. filename
        elseif filetype == "rust" then
          return "cargo run" -- Rust 项目默认使用 Cargo
        else
          return nil         -- 未支持的文件类型
        end
      end

      -- 创建或切换动态终端
      local function toggle_dynamic_term()
        local cmd = set_command_for_filetype()
        if not cmd then
          if dynamic_term then
            dynamic_term:close() -- 直接关闭终端
            dynamic_term = nil   -- 释放资源
          end
          print("Unsupported filetype: " .. vim.bo.filetype)
          return
        end

        if not dynamic_term then
          -- 创建一个新的终端实例
          dynamic_term = Terminal:new({
            cmd = "bash -c '" .. cmd .. "'", -- 动态命令
            hidden = true,
            direction = "float",             -- 浮动窗口
            close_on_exit = false,           -- 关闭时保持进程
            on_close = function(term)
              if term.job_id then
                vim.fn.jobstop(term.job_id) -- 终止进程
                print("Terminated process:", term.job_id)
              end
              dynamic_term = nil -- 清空实例
            end,
          })
        end

        -- 切换终端的显示状态
        dynamic_term:toggle()
      end

      -- 修复终端中按键后无法关闭的问题
      local function fix_toggle_key()
        vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
      end

      -- 自动为终端模式添加退出键绑定
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = fix_toggle_key,
      })

      -- 为快捷键绑定动态终端
      vim.keymap.set("n", "r", toggle_dynamic_term, { noremap = true, silent = true })
    end,
  },
}
