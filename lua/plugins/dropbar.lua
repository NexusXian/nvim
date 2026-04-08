return {
  "Bekaboo/dropbar.nvim",
  config = function()
    local utils = require("dropbar.utils")

    require("dropbar").setup({
      bar = {
        enable = function(buf, win, _)
          local exclude_filetypes = {
            "neo-tree",
            "NvimTree",
            "aerial",
            "Outline",
            "toggleterm",
            "TelescopePrompt",
            "help",
            "lazy",
            "mason",
            "notify",
            "noice",
            "qf",
          }
          local ft = vim.bo[buf].filetype
          for _, v in ipairs(exclude_filetypes) do
            if ft == v then return false end
          end
          return vim.api.nvim_buf_is_valid(buf)
            and vim.api.nvim_win_is_valid(win)
            and vim.bo[buf].buflisted
            and vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      menu = {
        quick_navigation = true,
        keymaps = {
          ["<LeftMouse>"] = function()
            local menu = utils.menu.get_current()
            if not menu then return end
            local mouse = vim.fn.getmousepos()
            local clicked_menu = utils.menu.get({ win = mouse.winid })
            if clicked_menu then
              clicked_menu:click_at({ mouse.line, mouse.column - 1 }, 0, 1, "l")
              return
            end
            utils.menu.exec("close")
            utils.bar.exec("update_current_context_hl")
            if vim.api.nvim_win_is_valid(mouse.winid) then
              vim.api.nvim_set_current_win(mouse.winid)
            end
          end,
          ["<CR>"] = function()
            local menu = utils.menu.get_current()
            if not menu then return end
            local cursor = vim.api.nvim_win_get_cursor(menu.win)
            local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
            if component then
              menu:click_on(component, nil, 1, "l")
            end
          end,
          ["i"] = function()
            local menu = utils.menu.get_current()
            if not menu then return end
            local cursor = vim.api.nvim_win_get_cursor(menu.win)
            local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
            if component then
              menu:click_on(component, nil, 1, "l")
            end
          end,
          ["<Esc>"] = "<C-w>q",
          ["q"]     = "<C-w>q",
          ["n"]     = "<C-w>q",
          ["<MouseMove>"] = function()
            local menu = utils.menu.get_current()
            if not menu then return end
            local mouse = vim.fn.getmousepos()
            if mouse.winid ~= menu.win then return end
            menu:update_hover_hl({ mouse.line, mouse.column - 1 })
          end,
        },
      },
    })
  end,
}
