return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>un',
      function()
        require('notify').dismiss({ silent = true, pending = true })
      end,
      desc = 'Dismiss All Notifications',
    },
    {
      '<leader>nh',
      function()
        require('telescope').extensions.notify.notify()
      end,
      desc = 'Show Notification History',
    },
  },
  dependencies = {
    'nvim-telescope/telescope.nvim', -- 可选，用于查看通知历史
  },
  config = function()
    local notify = require('notify')
    
    notify.setup({
      -- 动画样式：fade_in_slide_out, fade, slide, static
      stages = 'fade_in_slide_out',
      
      -- 超时时间（毫秒）
      timeout = 3000,
      
      -- 背景颜色（对于透明主题很重要）
      background_colour = '#1e1e2e',
      
      -- 图标设置
      icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        DEBUG = '',
        TRACE = '✎',
      },
      
      -- 最大高度和宽度
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      
      -- 最小宽度
      minimum_width = 50,
      
      -- 渲染器：default, minimal, simple, compact
      render = 'compact',
      
      -- 顶层设置
      top_down = true,
      
      -- 时间格式
      time_formats = {
        notification_history = '%FT%T',
        notification = '%T',
      },
      
      -- 级别设置（1=ERROR, 2=WARN, 3=INFO, 4=DEBUG, 5=TRACE）
      level = vim.log.levels.INFO,
      
      -- 动画帧率
      fps = 30,
      
      -- 自定义高亮组
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { focusable = false })
      end,
    })
    
    -- 设置为默认通知函数
    vim.notify = notify
    
    -- 集成 Telescope（如果可用）
    pcall(function()
      require('telescope').load_extension('notify')
    end)
    
    -- 实用的通知函数
    _G.notify_info = function(msg, title)
      notify(msg, vim.log.levels.INFO, { title = title or 'Info' })
    end
    
    _G.notify_warn = function(msg, title)
      notify(msg, vim.log.levels.WARN, { title = title or 'Warning' })
    end
    
    _G.notify_error = function(msg, title)
      notify(msg, vim.log.levels.ERROR, { title = title or 'Error' })
    end
    
    _G.notify_debug = function(msg, title)
      notify(msg, vim.log.levels.DEBUG, { title = title or 'Debug' })
    end
    
  end,
}
