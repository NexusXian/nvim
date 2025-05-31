return {
  "Civitasv/cmake-tools.nvim",
  ft = { "cmake", "cpp", "c" }, -- 打开CMake/C++/C文件时加载
  opts = {
    cmake_command = "cmake",
    ctest_command = "ctest",
    cmake_use_preset = true,
    cmake_regenerate_on_save = true,
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_options = {},
    cmake_build_directory = function()
      local osys = require("cmake-tools.osys")
      if osys.iswin32 then
        return "out\\${variant:buildType}"
      end
      return "out/${variant:buildType}"
    end,
    cmake_compile_commands_options = {
      action = "soft_link",
      target = vim.loop.cwd(),
    },
    cmake_kits_path = nil,
    cmake_variants_message = {
      short = { show = true },
      long = { show = true, max_length = 40 },
    },
    cmake_dap_configuration = {
      name = "cpp",
      type = "codelldb",
      request = "launch",
      stopOnEntry = false,
      runInTerminal = true,
      console = "integratedTerminal",
    },
    cmake_executor = {
      name = "quickfix",
      opts = {},
      default_opts = {
        quickfix = {
          show = "always",
          position = "belowright",
          size = 10,
          encoding = "utf-8",
          auto_close_when_success = true,
        },
        toggleterm = {
          direction = "float",
          close_on_exit = false,
          auto_scroll = true,
          singleton = true,
        },
        overseer = {
          new_task_opts = {
            strategy = {
              "toggleterm",
              direction = "horizontal",
              auto_scroll = true,
              quit_on_exit = "success",
            },
          },
          on_new_task = function(task)
            require("overseer").open({ enter = false, direction = "right" })
          end,
        },
        terminal = {
          name = "Main Terminal",
          prefix_name = "[CMakeTools]: ",
          split_direction = "horizontal",
          split_size = 11,
          single_terminal_per_instance = true,
          single_terminal_per_tab = true,
          keep_terminal_static_location = true,
          auto_resize = true,
          start_insert = false,
          focus = false,
          do_not_add_newline = false,
        },
      },
    },
    cmake_runner = {
      name = "terminal",
      opts = {},
      default_opts = {
        quickfix = {
          show = "always",
          position = "belowright",
          size = 10,
          encoding = "utf-8",
          auto_close_when_success = true,
        },
        toggleterm = {
          direction = "float",
          close_on_exit = false,
          auto_scroll = true,
          singleton = true,
        },
        overseer = {
          new_task_opts = {
            strategy = {
              "toggleterm",
              direction = "horizontal",
              auto_scroll = true,
              quit_on_exit = "success",
            },
          },
          on_new_task = function(task) end,
        },
        terminal = {
          name = "Main Terminal",
          prefix_name = "[CMakeTools]: ",
          split_direction = "horizontal",
          split_size = 11,
          single_terminal_per_instance = true,
          single_terminal_per_tab = true,
          keep_terminal_static_location = true,
          auto_resize = true,
          start_insert = false,
          focus = false,
          do_not_add_newline = false,
        },
      },
    },
    cmake_notifications = {
      runner = { enabled = true },
      executor = { enabled = true },
      spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      refresh_rate_ms = 100,
    },
    cmake_virtual_text_support = true,
    cmake_use_scratch_buffer = false,
  },
}
