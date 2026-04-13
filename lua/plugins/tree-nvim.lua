return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree toggle left<CR>",
        desc = "Toggle File Explorer (neo-tree)",
      },
    },
    cmd = {
      "Neotree",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- 创建 Go 文件时自动写入 package
      local function write_go_package(path)
        if not path or not path:match("%.go$") then
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

      require("neo-tree").setup({
        close_if_last_window = false,

        default_component_configs = {
          git_status = {
            symbols = {
              added     = "✚",
              deleted   = "✖",
              modified  = "",
              renamed   = "󰁕",
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            },
          },
          diagnostics = {
            symbols = {
              hint = "",
              info = "",
              warn = "",
              error = "",
            },
            highlights = {
              hint = "DiagnosticSignHint",
              info = "DiagnosticSignInfo",
              warn = "DiagnosticSignWarn",
              error = "DiagnosticSignError",
            },
          },
          indent = {
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
          },
        },

        window = {
          position = "left",
          width = 35,
        },

        filesystem = {
          bind_to_cwd = true,
          cwd_target = {
            sidebar = "tab",
            current = "window",
          },

          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },

          use_libuv_file_watcher = true,
          hijack_netrw_behavior = "open_default",

          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
          },

          window = {
            mappings = {
              ["<cr>"] = "open",
              ["l"] = "open",
              ["h"] = "close_node",
            },
          },
        },

        event_handlers = {
          {
            event = "file_added",
            handler = function(file_path)
              write_go_package(file_path)
            end,
          },
        },
      })
    end,
  },
}
