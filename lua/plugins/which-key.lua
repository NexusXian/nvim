return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- 布局预设，可选值: "classic", "modern", "helix" 或 false
    preset = "classic",
    -- 弹出窗口显示前的延迟时间，可传入数字或函数
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    -- 过滤映射的函数，例如排除没有描述的映射
    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ""
    end,
    -- 可以在这里添加映射，或稍后使用 `require('which-key').add()`
    spec = {},
    -- 检测到映射问题时显示警告
    notify = true,
    -- 自动设置映射的触发器，也可手动设置
    triggers = {
      { "<auto>", mode = "nxso" },
    },
    -- 仅在启用的 xo 映射模式下使用，开始时隐藏并等待按键后显示
    defer = function(ctx)
      return ctx.mode == "V" or ctx.mode == "<C-V>"
    end,
    -- 插件配置
    plugins = {
      marks = true,       -- 在 ' 和 ` 键显示标记列表
      registers = true,   -- 在普通模式下按 " 或插入模式下按 <C-r> 显示寄存器列表
      spelling = {
        enabled = true,   -- 按下 z= 时显示拼写建议
        suggestions = 20, -- 显示的建议数量
      },
      presets = {
        operators = true,    -- 为操作符（如 d, y 等）添加帮助
        motions = true,      -- 为移动键添加帮助
        text_objects = true, -- 为文本对象添加帮助
        windows = true,      -- 为 <c-w> 键添加默认绑定帮助
        nav = true,          -- 为窗口导航键添加帮助
        z = true,            -- 为以 z 开头的快捷键添加帮助
        g = true,            -- 为以 g 开头的快捷键添加帮助
      },
    },
    -- 窗口配置
    win = {
      -- 不允许弹出窗口与光标重叠
      no_overlap = true,
      -- 额外的窗口内边距 [上下, 左右]
      padding = { 1, 2 },
      -- 显示窗口标题
      title = true,
      -- 标题位置
      title_pos = "center",
      -- 窗口的 z 轴索引
      zindex = 1000,
      -- 额外的 vim.wo 和 vim.bo 选项
      bo = {},
      wo = {
        -- 窗口透明度，0 为完全不透明，100 为完全透明
        -- winblend = 10,
      },
    },
    -- 布局配置
    layout = {
      -- 列的最小宽度
      width = { min = 20 },
      -- 列之间的间距
      spacing = 3,
    },
    -- 滚动按键绑定
    keys = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    -- 映射排序规则
    sort = { "local", "order", "group", "alphanum", "mod" },
    -- 展开组的条件
    expand = 0,
    -- 格式化标签的函数或 Lua 模式
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
      },
      desc = {
        { "<Plug>%(?(.*)%)?", "%1" },
        { "^%+",              "" },
        { "<[cC]md>",         "" },
        { "<[cC][rR]>",       "" },
        { "<[sS]ilent>",      "" },
        { "^lua%s+",          "" },
        { "^call%s+",         "" },
        { "^:%s*",            "" },
      },
    },
    -- 图标配置
    icons = {
      breadcrumb = "»", -- 命令行区域显示活动键组合的符号
      separator = "➜", -- 键和标签之间的分隔符
      group = "+", -- 组的前缀符号
      ellipsis = "…",
      -- 启用或禁用所有映射图标
      mappings = true,
      -- 图标规则
      rules = {},
      -- 使用 mini.icons 的高亮
      colors = true,
      -- 键格式使用的图标
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        D = "󰘳 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "󰁮",
        Space = "󱁐 ",
        Tab = "󰌒 ",
        F1 = "󱊫",
        F2 = "󱊬",
        F3 = "󱊭",
        F4 = "󱊮",
        F5 = "󱊯",
        F6 = "󱊰",
        F7 = "󱊱",
        F8 = "󱊲",
        F9 = "󱊳",
        F10 = "󱊴",
        F11 = "󱊵",
        F12 = "󱊶",
      },
    },
    -- 在命令行显示使用 WhichKey 的帮助信息
    show_help = true,
    -- 在命令行显示当前按下的键及其标签
    show_keys = true,
    -- 禁用 WhichKey 的缓冲区类型和文件类型
    disable = {
      ft = {},
      bt = {},
    },
    -- 启用调试日志
    debug = false,
  },
}
