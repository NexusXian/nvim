return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  opts = {
    options = {
      mode = "buffers",

      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,

      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and "" or ""
        return " " .. icon .. " " .. count
      end,

      indicator = {
        style = "underline",
      },

      numbers = "none",

      modified_icon = "●",
      buffer_close_icon = "",
      close_icon = "",
      left_trunc_marker = "…",
      right_trunc_marker = "…",

      max_name_length = 24,
      max_prefix_length = 20,
      truncate_names = true,
      tab_size = 22,
      padding = 1,

      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = false,
      show_duplicate_prefix = true,

      persist_buffer_sort = true,
      enforce_regular_tabs = true,
      always_show_bufferline = true,

      separator_style = "thin",

      hover = {
        enabled = false,
      },

      offsets = {
        {
          filetype = "NvimTree",
          text = "Project",
          text_align = "left",
          separator = true,
        },
      },

      sort_by = "insert_after_current",
    },

    highlights = {
      fill = {
        bg = "NONE",
      },

      background = {
        italic = false,
        bold = false,
      },

      buffer_selected = {
        bold = true,
        italic = false,
      },

      numbers = {
        italic = false,
      },

      numbers_selected = {
        bold = true,
        italic = false,
      },

      diagnostic = {
        italic = false,
      },

      diagnostic_selected = {
        bold = true,
        italic = false,
      },

      hint = {
        italic = false,
      },

      hint_selected = {
        bold = true,
        italic = false,
      },

      info = {
        italic = false,
      },

      info_selected = {
        bold = true,
        italic = false,
      },

      warning = {
        italic = false,
      },

      warning_selected = {
        bold = true,
        italic = false,
      },

      error = {
        italic = false,
      },

      error_selected = {
        bold = true,
        italic = false,
      },

      modified = {
        italic = false,
      },

      modified_selected = {
        bold = true,
        italic = false,
      },

      separator = {
        fg = "NONE",
        bg = "NONE",
      },

      separator_selected = {
        fg = "NONE",
        bg = "NONE",
      },

      indicator_selected = {
        bold = true,
      },
    },
  },
}
