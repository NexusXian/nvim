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
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'f',
            keymap = 'SPC f f',
            key_hl = 'Number',
            action = 'Telescope find_files'
          },
          {
            icon = ' ',
            desc = 'Find Recent Files   ',
            key = 'r',
            keymap = 'SPC f r',
            action = 'Telescope oldfiles'
          },
          {
            icon = ' ',
            desc = 'Find Word           ',
            key = 'w',
            keymap = 'SPC f w',
            action = 'Telescope live_grep'
          },
          {
            icon = ' ',
            desc = 'New File            ',
            key = 'n',
            keymap = 'SPC f n',
            action = 'enew'
          },
          {
            icon = ' ',
            desc = 'Config              ',
            key = 'c',
            keymap = 'SPC f c',
            action = 'edit ~/.config/nvim/init.lua'
          },
          {
            icon = ' ',
            desc = 'Exit Neovim         ',
            key = 'q',
            keymap = 'SPC q q',
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
