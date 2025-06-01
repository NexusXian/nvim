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
            icon = '  ',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'f',
            keymap = 'f',
            key_hl = 'Number',
            action = 'Telescope find_files'
          },
          {
            icon = '  ',
            desc = 'Find Recent Files   ',
            key = 'r',
            keymap = 'r',
            action = 'Telescope oldfiles'
          },
          {
            icon = '󰈙  ',
            desc = 'New File            ',
            key = 'n',
            keymap = 'n',
            action = 'enew'
          },
          {
            icon = '󰒲  ',
            desc = 'Lazy            ',
            key = 'l',
            keymap = 'l',
            action = 'Lazy'
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
