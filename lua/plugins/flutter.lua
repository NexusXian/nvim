return {
  "nvim-flutter/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      ui = {
        -- 所有浮动窗口的边框样式
        border = "rounded",

        -- 通知样式：native 使用 vim.notify，plugin 使用插件自带 UI
        notification_style = "native",
      },

      decorations = {
        statusline = {
          -- 是否在状态栏显示 Flutter 应用版本（来自 pubspec.yaml）
          app_version = false,

          -- 是否在状态栏显示当前运行的设备
          device = true,

          -- 是否在状态栏显示当前项目配置
          project_config = false,
        },
      },

      debugger = {
        -- 是否集成 nvim-dap（Dart 调试器）
        enabled = false,

        -- 需要在哪些异常时中断调试
        exception_breakpoints = {},

        -- 是否在调试视图中调用 toString()
        evaluate_to_string_in_debug_views = true,
      },

      -- 如果 flutter 在 PATH 中，可以直接设为 nil
      flutter_path = nil,

      -- 查找 flutter 的命令，一般不需要
      flutter_lookup_cmd = nil,

      -- Flutter 项目根目录识别规则
      root_patterns = { ".git", "pubspec.yaml" },

      -- 是否使用 fvm（优先级高于 flutter_path）
      fvm = false,

      -- flutter run / dart run 的默认参数
      default_run_args = nil,

      widget_guides = {
        -- 是否显示 Widget 层级辅助线
        enabled = false,
      },


      dev_log = {
        -- 是否启用 Flutter Dev Log
        enabled = true,

        -- 日志过滤函数（nil 表示不过滤）
        filter = nil,

        -- 运行错误时是否弹出通知
        notify_errors = false,

        -- 打开日志窗口的命令
        open_cmd = "15split",

        -- 打开时是否自动聚焦
        focus_on_open = true,
      },

      dev_tools = {
        -- 是否自动启动 DevTools Server
        autostart = false,

        -- 是否自动在浏览器中打开 DevTools
        auto_open_browser = false,
      },

      outline = {
        -- 打开 Outline 的窗口命令
        open_cmd = "20vnew",

        -- 是否自动打开 Outline
        auto_open = false,
      },

      lsp = {
        color = {
          -- 是否高亮 Dart 中的颜色变量（Flutter >= 2.10）
          enabled = false,

          -- 是否高亮背景色
          background = false,

          -- 背景透明时使用的背景颜色
          background_color = nil,

          -- 是否高亮前景色
          foreground = false,

          -- 是否使用虚拟文本显示颜色
          virtual_text = true,

          -- 虚拟文本字符
          virtual_text_str = "■",
        },

        -- LSP attach 回调（如果你有）
        on_attach = my_custom_on_attach,

        -- LSP capabilities（推荐只保留一种）
        capabilities = my_custom_capabilities,

        -- Dart Analysis Server 设置
        settings = {
          showTodos = true,
          completeFunctionCalls = true,

          -- 排除分析的目录
          analysisExcludedFolders = {
            -- "/path/to/flutter/packages",
          },

          -- 重命名类时是否同时重命名文件
          renameFilesWithClasses = "prompt",

          -- 是否启用代码片段
          enableSnippets = true,

          -- 重命名文件时是否自动更新 import
          updateImportsOnRename = true,
        },
      },
    })
  end,
}

