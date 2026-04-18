return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree toggle<CR>",
        desc = "Toggle File Explorer (neo-tree)",
      },
    },
    cmd = { "Neotree" },
    config = function()
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
        pattern = "*.go",
        callback = function(args)
          local path = args.file
          if path == "" then return end

          local stat = vim.loop.fs_stat(path)
          -- 已有内容则跳过
          if stat and stat.size > 0 then return end

          local pkg = vim.fn.fnamemodify(path, ":h:t")
          if pkg == "." or pkg == "" then pkg = "main" end

          -- 确保是当前 buffer
          if vim.api.nvim_buf_get_name(0) ~= path then return end

          local line_count = vim.api.nvim_buf_line_count(0)
          local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
          if first_line ~= "" then return end

          vim.api.nvim_buf_set_lines(0, 0, line_count, false, {
            "package " .. pkg,
            "",
          })
          vim.cmd("write")
        end,
      })

      require("neo-tree").setup({
        close_if_last_window = false,
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
        enable_git_status = true,
        enable_diagnostics = true,

        default_component_configs = {
          indent = {
            with_expanders = true,
            expander_collapsed = "\u{f054}", --  right arrow
            expander_expanded  = "\u{f078}", --  down arrow
          },
          icon = {
            folder_closed    = "\u{f07b}", -- 
            folder_open      = "\u{f07c}", -- 
            folder_empty     = "\u{f07b}", -- 
            default          = "\u{f15b}", -- 
          },
          diagnostics = {
            symbols = {
              hint  = "\u{f002}", -- 
              info  = "\u{f05a}", -- 
              warn  = "\u{f071}", -- 
              error = "\u{f057}", -- 
            },
          },
          git_status = {
            symbols = {
              added     = "\u{f055}", -- 
              modified  = "\u{f040}", -- 
              deleted   = "\u{f057}", -- 
              renamed   = "\u{f074}", -- 
              untracked = "\u{f128}", -- 
              ignored   = "\u{f05e}", -- 
              unstaged  = "\u{f111}", -- 
              staged    = "\u{f00c}", -- 
              conflict  = "\u{f071}", -- 
            },
          },
        },

        window = {
          position = "left",
          width = 35,
          mappings = {
            ["<space>"] = "toggle_node",
            ["<cr>"]    = "open",
            ["s"]       = "open_vsplit",
            ["S"]       = "open_split",
            ["t"]       = "open_tabnew",
            ["C"]       = "close_node",
            ["z"]       = "close_all_nodes",
            ["R"]       = "refresh",
            ["a"]       = "add",
            ["d"]       = "delete",
            ["r"]       = "rename",
            ["y"]       = "copy_to_clipboard",
            ["x"]       = "cut_to_clipboard",
            ["p"]       = "paste_from_clipboard",
            ["q"]       = "close_window",
            ["?"]       = "show_help",
          },
        },

        filesystem = {
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
            hide_by_name = { ".git", "node_modules" },
            never_show  = { ".DS_Store", "thumbs.db" },
          },
        },

        sources = { "filesystem", "git_status" },
      })
    end,
  },
}
