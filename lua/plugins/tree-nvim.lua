return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      {
        "<leader>e",
        "<cmd>NvimTreeToggle<CR>",
        desc = "Toggle File Explorer (nvim-tree)",
      },
    },

    cmd = {
      "NvimTreeToggle",
      "NvimTreeOpen",
      "NvimTreeFocus",
      "NvimTreeFindFileToggle",
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local api = require("nvim-tree.api")

      -- 创建 Go 文件时自动写入 package
      local function write_go_package(path)
        if not path:match("%.go$") then
          return
        end

        -- 已有内容的不处理
        local stat = vim.loop.fs_stat(path)
        if stat and stat.size > 0 then
          return
        end

        -- 目录名作为 package 名
        local pkg = vim.fn.fnamemodify(path, ":h:t")
        if pkg == "." or pkg == "" then
          pkg = "main"
        end

        vim.schedule(function()
          vim.cmd("edit " .. vim.fn.fnameescape(path))
          vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "package " .. pkg,
            "",
          })
          vim.cmd("write")
        end)
      end

      -- 订阅 nvim-tree 文件创建事件
      api.events.subscribe(api.events.Event.FileCreated, function(file)
        write_go_package(file.fname)
      end)

      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = false,
          },
        },

        update_focused_file = {
          enable = true,
          update_cwd = true,
        },

        view = {
          width = 35,
          side = "left",
          preserve_window_proportions = true,
        },

        renderer = {
          highlight_git = true,
          icons = {
            show = {
              folder_arrow = true,
            },
          },
        },

        filters = {
          dotfiles = false,
        },

        diagnostics = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = true,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
      })
    end,
  },
}
