return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = {
          '',
          '',
          '',
          '███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗',
          '████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝',
          '██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗',
          '██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║',
          '██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║',
          '╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝',
          '',
          '',
        },
        center = {
          {
            icon = '󰈙  ',
            desc = 'New File            ',
            key = 'n',
            keymap = 'n',
            action = 'enew'
          },
          {
            icon = '  ',
            desc = 'Config              ',
            key = 'c',
            keymap = 'c',
            action = 'edit ~/.config/nvim/init.lua'
          },
          {
            icon = '󰿅  ',
            desc = 'Exit Neovim         ',
            key = 'q',
            keymap = 'q',
            action = 'qa'
          },
        },
        footer = function()
         local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      }
    }
  end
}
