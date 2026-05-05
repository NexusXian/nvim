return {
  "nvim-flutter/flutter-tools.nvim",
  ft = "dart",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      ui = {
        border = "rounded",
        notification_style = "native",
      },

      decorations = {
        statusline = {
          app_version = false,
          device = true,
          project_config = false,
        },
      },

      debugger = {
        enabled = false,
        exception_breakpoints = {},
        evaluate_to_string_in_debug_views = true,
      },

      flutter_path = nil,
      flutter_lookup_cmd = nil,
      root_patterns = { ".git", "pubspec.yaml" },
      fvm = false,
      default_run_args = nil,

      widget_guides = {
        enabled = false,
      },

      dev_log = {
        enabled = true,
        filter = nil,
        notify_errors = false,
        open_cmd = "15split",
        focus_on_open = true,
      },

      dev_tools = {
        autostart = false,
        auto_open_browser = false,
      },

      outline = {
        open_cmd = "20vnew",
        auto_open = false,
      },

      lsp = {

        on_attach = my_custom_on_attach,
        capabilities = my_custom_capabilities,

        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
          updateImportsOnRename = true,
        },
      },
    })
  end,
}
