return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",

      -- UI
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup({
            icons = {
              expanded = "▾",
              collapsed = "▸",
              current_frame = "➜",
            },
            layouts = {
              {
                elements = {
                  { id = "scopes",      size = 0.25 },
                  { id = "breakpoints", size = 0.25 },
                  { id = "stacks",      size = 0.25 },
                  { id = "watches",     size = 0.25 },
                },
                size = 40,
                position = "left",
              },
              {
                elements = {
                  { id = "repl",    size = 0.5 },
                  { id = "console", size = 0.5 },
                },
                size = 10,
                position = "bottom",
              },
            },
            controls = {
              enabled = true,
              element = "repl",
              icons = {
                icons = {
                  play = "▶",
                  pause = "⏸",
                  step_into = "↓",
                  step_over = "→",
                  step_out = "↑",
                  terminate = "■",
                },
              },
            },
            floating = {
              border = "rounded",
            },
          })
        end,
      },

      -- 虚拟文本
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
          enabled = true,
          enabled_commands = true,
          highlight_changed_variables = true,
          show_stop_reason = true,
          commented = false,
          only_first_definition = true,
          virt_text_pos = "eol",
        },
      },

      -- adapter 管理
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
          "williamboman/mason.nvim",
        },
        opts = {
          ensure_installed = {
            "codelldb",
            "delve",
          },
          automatic_installation = true,
        },
      },
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- =========================
      -- 图标（核心）
      -- =========================
      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
      })

      vim.fn.sign_define("DapBreakpointCondition", {
        text = "",
        texthl = "DiagnosticSignWarn",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "",
        texthl = "DiagnosticSignError",
      })

      vim.fn.sign_define("DapLogPoint", {
        text = "",
        texthl = "DiagnosticSignInfo",
      })

      vim.fn.sign_define("DapStopped", {
        text = "➜",
        texthl = "DiagnosticSignHint",
        linehl = "Visual",
        numhl = "DiagnosticSignHint",
      })

      -- =========================
      -- 自动 UI
      -- =========================
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- =========================
      -- C / C++ / Rust
      -- =========================
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/",
              "file"
            )
          end,
          cwd = "${workspaceFolder}",
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      -- =========================
      -- Dart
      -- =========================
      dap.adapters.dart = {
        type = "executable",
        command = "dart",
        args = { "debug_adapter" },
      }

      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch Dart",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }

      -- =========================
      -- Go
      -- =========================
      dap.adapters.go = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }

      dap.configurations.go = {
        {
          type = "go",
          name = "Debug File",
          request = "launch",
          program = "${file}",
        },
        {
          type = "go",
          name = "Debug Package",
          request = "launch",
          program = "${fileDirname}",
        },
        {
          type = "go",
          name = "Debug Test",
          request = "launch",
          mode = "test",
          program = "${file}",
        },
      }
    end,
  },
}
